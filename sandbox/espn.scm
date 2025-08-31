;; *********************************************************************************************************************
;; Test accessing data, parsing json, etc, from espn nfl api
;; *********************************************************************************************************************

(use-modules (oop goops))

(use-modules (web client))
(use-modules (web response))

(use-modules (bad-cat utils))

(use-modules (bad-cat nfldb json))
(use-modules (bad-cat nfldb game))
(use-modules (bad-cat nfldb team))
(use-modules (bad-cat nfldb serialize))

;; https://sports.core.api.espn.com/v2/sports/football/leagues/nfl/events
(define espn-host-core "sports.core.api.espn.com")
(define espn-host-cdn "cdn.espn.com")

(define events-path "v2/sports/football/leagues/nfl/events")

(define div-map (make-hash-table))
(define conf-map (make-hash-table))
(define url-map (make-hash-table))

;;
;; Basic fetching
;;

(define (espn-get-url url proc)
  (format #t "#### URL  : ~a~%" url)
  (let ( (res (http-get url #:streaming? #t)) )
;   (format #t "#### RES  : ~a~%" res)
    (if (eq? 200 (response-code res))
      (let ( (data (proc (response-body-port res))) )
        data)
      (throw 'connection-failed (response-code res) (response-reason-phrase res)))))

(define (espn-get-page host path proc) (espn-get-url (format #f "https://~a/~a" host path) proc))

;;
;; Manage mappings to conferences and divisions
;;

(define (lookup-conf-id id)
  (let ( (conf-sym (hash-ref conf-map id)) )
    (if conf-sym
      conf-sym
      (let ( (page (format #f "v2/sports/football/leagues/nfl/seasons/2025/types/1/groups/~a?lang=en&region=us" id)) )
        (let ( (json (espn-get-page espn-host-core page port->json-obj)) )
          (if (not json) (throw 'unable-to-find-conference))
          (if (not (json-ref isConference json)) (throw 'id-does-not-identify-a-confernce))
          (let ( (abbrev (string->symbol (json-ref abbreviation json))) )
            (hash-set! conf-map id abbrev)
            abbrev))))))

(define (lookup-div-id id)
  (let ( (div-sym (hash-ref div-map id)) )
    (if div-sym
      div-sym
      (let ( (page (format #f "v2/sports/football/leagues/nfl/seasons/2025/types/1/groups/~a?lang=en&region=us" id)) )
        (let ( (json (espn-get-page espn-host-core page port->json-obj)) )
          (if (not json) (throw 'unable-to-find-division))
          (if (json-ref isConference json) (throw 'id-does-not-identify-a-division))
          (let ( (abbrev (string->symbol (json-ref abbreviation json))) )
            (hash-set! div-map id abbrev)
            abbrev))))))

(define (lookup-division url)
  (let ( (cached (hash-ref url-map url)) )
    (if cached
      cached
      (let ( (div-json (espn-get-url url port->json-obj)) )
        (let ( (conf-url (json-ref parent.$ref div-json)) )
          (let ( (conf-json (espn-get-url conf-url port->json-obj)) )
            (let ( (pair (cons (string->symbol (json-ref abbreviation conf-json))
                               (string->symbol (json-ref abbreviation div-json)))) )
              (hash-set! url-map url pair)
              pair)))))))

;;
;; Front facing methods
;;

(define (espn-get-games year weekno)
  (define (read-buffer-from-port p)
    (define (proc sofar)
      (let ( (next (read-char p)) )
        (if (eof-object? next)
          (list->string (reverse sofar))
          (proc (cons next sofar)))))
    (proc '()))
  ;; The xhr=1 parameter gives json instead of html
  (let ( (path (format #f "core/nfl/schedule?xhr=1&week=~a&year=~a" weekno year)) )
    (let ( (json (espn-get-page espn-host-cdn path port->json-obj)) )
      (let ( (gamedays (json-ref content.schedule json)) )
        (format #t "gamedays = ~a~%" gamedays)
        (let ( (dates (sort (json-keys gamedays) (lambda (a b) (apply string<? (map symbol->string (list a b)))))) )
          (format #t "dates = ~a~%" dates)
          (map (lambda (x) (make-game x year))
               (apply append (apply append (map (lambda (x) (hash-map->list (lambda (n v) v) x))
                                                (map (lambda (date)
                                                       (format #t "getting ~a from ~a~%" date gamedays)
                                                       (hash-ref gamedays date))
                                                     dates))))))))))

(define (make-game json year)
  (let ( (thash (make-hash-table)) )
    (hash-set! thash
               (string->symbol (json-ref competitions.0.competitors.0.homeAway json))
               (get-team (string->number (json-ref competitions.0.competitors.0.id json))))
    (hash-set! thash
               (string->symbol (json-ref competitions.0.competitors.1.homeAway json))
               (get-team (string->number (json-ref competitions.0.competitors.1.id json))))
    (make-instance <nfl-game>
                   #:week (1- (json-ref week.number json))
                   #:year year
                   #:time #f
                   #:home (hash-ref thash 'home)
                   #:away (hash-ref thash 'away))))

(define (espn-get-teams)
  (let ( (json (espn-get-page espn-host-core "v2/sports/football/leagues/nfl/teams?limit=320" port->json-obj)) )
    (let ( (team-urls (map (lambda (x) (json-ref $ref x)) (json-ref items json))) )
      (map slurp-team team-urls))))

(define (slurp-team team-url)
  (let ( (json (espn-get-url team-url port->json-obj)) )
    (let ( (division (lookup-division (json-ref groups.$ref json))) )
      (let ( (id (string->number (json-ref id json))) )
        (if (not (get-team id))
          (make-instance <nfl-team>
                         #:id id
                         #:nick (string->symbol (json-ref abbreviation json))
                         #:conf (car division)
                         #:div (cdr division)))))))

; (espn-get-teams)

;;
;; quick and dirty persistance
;;

;; REFRESH TEAMS *******************************************************************************************************

(define league-mod '(bad-cat nfldb data league))
(define league-mod-file (format #f "~a.scm" (string-join (map symbol->string league-mod) "/")))

(define (write-teams-module-file teams out)
  (define (write-team t)
    (format out "~%")
    (serialize t out)
    (format out "~%"))
  (define (write-div c d)
    (format #t ";; ~a ~a~%" c d)
    (map write-team (get-div c d))
    (format #t "~%"))
  (format #t "(define-module ~a~%" league-mod)
  (format #t " ;; DO NOT EDIT! Generated by sandbox/espn.scm write-teams-module-file~%")
  (format #t " ;; Just a hack for now to keep from having to download static data every time the script is loaded~%")
  (format #t "~%")
  (format #t " #:use-module (oop goops)~%")
  (format #t " #:use-module (bad-cat nfldb team)~%")
  (format #t ")~%")
  (format #t "~%")
  (map (lambda (c)
         (map (lambda (d) (write-div c d))
              '(NORTH SOUTH EAST WEST)))
       '(AFC NFC)))

(define-method (refresh-team-module)
  (espn-get-teams)
  (with-output-to-file league-mod-file (lambda () (write-teams-module-file (all-nfl-teams) (current-output-port)))))

;; REFRESH SCHEDULE ****************************************************************************************************

(define (week-mod year week)
  `(bad-cat nfldb data (string->symbol (number->string ,year)) (string->symbol (number->string ,week))))
(define (week-mod-file year week)
  (format #f "~a.scm" (string-join (map symbol->string (week-mod year week)) "/")))

(define (fetch-week teams)
  (define (write-team t)
    (format #t "~%")
    (serialize t (current-output-port))
    (format #t "~%"))
  (define (write-div c d)
    (format #t ";; ~a ~a~%" c d)
    (map write-team (get-div c d))
    (format #t "~%"))
  (format #t "(define-module ~a~%" league-module)
  (format #t " ;; DO NOT EDIT! Generated by sandbox/espn.scm write-module-file~%")
  (format #t " ;; Just a hack for now to keep from having to download static data every time the script is loaded~%")
  (format #t "~%")
  (format #t " #:use-module (oop goops)~%")
  (format #t " #:use-module (bad-cat nfldb team)~%")
  (format #t ")~%")
  (format #t "~%")
  (map (lambda (c)
         (map (lambda (d) (write-div c d))
              '(NORTH SOUTH EAST WEST)))
       '(AFC NFC)))

; (use-modules (bad-cat nfldb league))

