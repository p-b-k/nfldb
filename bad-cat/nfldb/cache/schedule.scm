(define-module (bad-cat nfldb cache schedule)

  ;; *******************************************************************************************************************
  ;; Cache for Schedule data
  ;; Very static. Might change if a game gets flexed
  ;; *******************************************************************************************************************

  #:use-module (oop goops)

  #:use-module (bad-cat utils)
  #:use-module (bad-cat nfldb)
  #:use-module (bad-cat nfldb cache)
  #:use-module (bad-cat nfldb espn)
  #:use-module (bad-cat nfldb team)
  #:use-module (bad-cat nfldb json)
  #:use-module (bad-cat nfldb game)
  #:use-module (bad-cat nfldb serialize)

  #:use-module (bad-cat nfldb cache league)

; #:export (<season-cache>)
; #:export (<schedule-cache>)

  #:export (schedule-restore)
  #:export (schedule-store)
  #:export (schedule-retrieve)

  #:export (add-season)
  #:export (get-games)
)

(define season-cache-root (format #f "~a/seasons" nfldb-cache-root))

(define-method (season-retrieve year)
  (let ( (weeks (make-array #f 18)) )
    (define (get-weeks weekno)
      (if (<= weekno 18)
        (begin
          (let ( (games (espn-get-games year weekno)) )
            (array-set! weeks games (1- weekno)))
          (get-weeks (1+ weekno)))
        weeks))
    (get-weeks 1)))

(define-method (season-store year weeks)
  (define (write-cache) (write-constructor weeks (current-output-port)))

  (format #t "season-store: writing cache ~a~%" (schedule))
  (let ( (output-file (format #f "~a/~2,'0d.scm" season-cache-root year)) )
    (format #t "season-store: output-file = ~a~%" output-file)
    (with-output-to-file output-file write-cache)))

(define-method (read-season-from-store (year <integer>))
  (let ( (cache-file (format #f "~a/~2,'0d.scm" season-cache-root year)) )
    (if (file-exists? cache-file)
      (let ( (cache-def (with-input-from-file cache-file read)) )
        (let ( (cache (nfldb-eval cache-def)) )
          cache))
      #f)))

;;
;; Individual Season Cache
;;

(define-class <schedule-cache> (<nfldb-cache>)
  (seasons      #:init-thunk      make-hash-table
                #:getter          sched.seasons)
)

(define-method (schedule-retrieve (year <integer>))
  (let ( (season (season-retrieve year)) )
    (format #t "Season for ~a is a ~a~%" year (class-name (class-of season)))
    (hash-set! (sched.seasons (schedule)) year season)
    #t))

(define-method (schedule-store)
  (format #t "schedule-store: calling on ~a (~a)~%" (schedule) (class-name (class-of (schedule))))
  (let ( (seasons (sched.seasons (schedule))) )
    (format #t "schedule-store: seasons = ~a~%" seasons)
    (hash-map->list (lambda (a b)
                      (format #t "cache-persist-store <schedule-cache>: b = ~a~%" b)
                      (season-store a b))
                    seasons)))

(define (list-cached-seasons)
  (define (get-year file)
    (if (file-exists? (format #f "~a/~a" season-cache-root file))
      (if (not (file-is-directory? (format #f "~a/~a" season-cache-root file)))
        (let ( (split (string-split file #\.)) )
          (if (and (= 2 (length split)) (string=? (cadr split) "scm"))
            (string->number (car split))
            #f))
        #f)
      #f))
  (define (read-years dir sofar)
    (let ( (next (readdir dir)) )
      (if (eof-object? next)
        sofar
        (let ( (year (get-year next)) )
          (if year
            (read-years dir (cons year sofar))
            (read-years dir sofar))))))
  (let ( (season-dir (opendir season-cache-root)) )
    (let ( (years (read-years season-dir '())) )
      (closedir season-dir)
      years)))

(define (schedule-restore)
  (define (add-season-cache year)
    (let ( (season-data (read-season-from-store year)) )
;     (format #t "schedule-restore: season-data is a ~a~%" (class-name (class-of season-data)))
      (hash-set! (sched.seasons (schedule)) year season-data)))
  (let ( (years (list-cached-seasons)) )
    (map add-season-cache years)))

(define-method (espn-get-games year weekno)
  ;; The xhr=1 parameter gives json instead of html
  (let ( (path (format #f "core/nfl/schedule?xhr=1&week=~a&year=~a" weekno year)) )
    (let ( (json (espn-get-page espn-host-cdn path port->json-obj)) )
      (let ( (gamedays (json-ref content.schedule json)) )
        (let ( (dates (sort (json-keys gamedays) (lambda (a b) (apply string<? (map symbol->string (list a b)))))) )
          (map (lambda (x) (make-game x year))
               (apply append (apply append (map (lambda (x) (hash-map->list (lambda (n v) v) x))
                                                (map (lambda (date) (hash-ref gamedays date))
                                                     dates))))))))))

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

;;
;; Global methods
;; 

(define schedule (make-parameter (make-instance <schedule-cache>)))

(define (get-games year week-no)
  (let ( (weeks (hash-ref (sched.seasons (schedule)) year)) )
    (if weeks
      (array-ref weeks (1- week-no))
      #f)))

