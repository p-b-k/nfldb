(define-module (bad-cat nfldb espn)

  ;; *******************************************************************************************************************
  ;; Tools to get data from ESPN api
  ;; *******************************************************************************************************************

  #:use-module (oop goops)
  #:use-module (srfi srfi-19)

  #:use-module (web client)
  #:use-module (web response)

  #:use-module (bad-cat utils)
  #:use-module (bad-cat nfldb data)
  #:use-module (bad-cat nfldb json)
  #:use-module (bad-cat nfldb team)
  #:use-module (bad-cat nfldb game)

  #:export (espn-get-url)
  #:export (espn-get-page)

  #:export (espn-host-core)
  #:export (espn-host-cdn)
  #:export (espn-datasource-new)

  #:export (read-espn-color)
)

(define espn-host-core "sports.core.api.espn.com")
(define espn-host-cdn "cdn.espn.com")

(define (espn-get-url url proc)
  (format #t "#### URL  : ~a~%" url)
  (let ( (res (http-get url #:streaming? #t)) )
;   (format #t "#### RES  : ~a~%" res)
    (if (eq? 200 (response-code res))
      (let ( (data (proc (response-body-port res))) )
        data)
      (throw 'connection-failed (response-code res) (response-reason-phrase res)))))

(define (espn-get-page host path proc)
  (espn-get-url (format #f "https://~a/~a" host path) proc))

(define-method (espn-get-games year weekno)
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
        (let ( (dates (sort (json-keys gamedays) (lambda (a b) (apply string<? (map symbol->string (list a b)))))) )
          (map (lambda (x) (make-game x year))
               (apply append (apply append (map (lambda (x) (hash-map->list (lambda (n v) v) x))
                                                (map (lambda (date) (hash-ref gamedays date))
                                                     dates))))))))))

(define (tz-offset) -4)
(define espn-date-fmt "~Y-~m-~dT~H:~MZ")

(define (read-espn-gametime date-string)
  (let ( (utc-date (string->date date-string espn-date-fmt)) )
;   (format #t "~s => ~a~%" date-string utc-date)
    (secs->gametime (time-second (date->time-utc (hour+ (date->time-utc utc-date) (tz-offset)))))))

(define (make-game json year)
  (let ( (thash (make-hash-table)) )
    (hash-set! thash
               (string->symbol (json-ref competitions.0.competitors.0.homeAway json))
               (get-team (string->number (json-ref competitions.0.competitors.0.id json))))
    (hash-set! thash
               (string->symbol (json-ref competitions.0.competitors.1.homeAway json))
               (get-team (string->number (json-ref competitions.0.competitors.1.id json))))
    (let ( (time (read-espn-gametime (json-ref date json))) )
      (make-instance <nfl-game>
                     #:id   (string->number (json-ref id json))
                     #:week (1- (json-ref week.number json))
                     #:year year
                     #:name (json-ref name json)
                     #:short-name (json-ref shortName json)
                     #:time time
                     #:home (team.nick (hash-ref thash 'home))
                     #:away (team.nick (hash-ref thash 'away))))))

;; *********************************************************************************************************************
;; Define the datasource that passes methods through the the above logic in the form of a data source
;; *********************************************************************************************************************

(define-class <espn-datasource> (<datasource>))

(define-method (datasource-get-games (ds <espn-datasource>) (year <integer>) (weekno <integer>))
  (espn-get-games year weekno))

(define (espn-datasource-new) (make-instance <espn-datasource>))

(define (read-espn-color color-string)
  (let ( (r (string->number (format #f "#x~a" (substring color-string 0 2))))
         (g (string->number (format #f "#x~a" (substring color-string 2 4))))
         (b (string->number (format #f "#x~a" (substring color-string 2 6)))) )
    (make-instance <rgb-color> #:r r #:g g #:b b)))

