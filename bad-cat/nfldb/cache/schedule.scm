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

  #:export (<season-cache>)
  #:export (<schedule-cache>)

  #:export (add-season)
  #:export (get-games)
)

;;
;; Individual Season Cache
;;

(define-class <season-cache> (<nfldb-cache>)
  (year         #:init-keyword    #:year
                #:getter          season.year)
  (weeks        #:init-keyword    #:weeks
                #:init-form       (make-array #f 18)
                #:getter          season.weeks)
)

(define (season-cache-file year)
  (format #f "~a/sched_~2,'0d.scm" nfldb-cache-root year))

(define-method (cache-sync! (c <season-cache>))
  (define (get-weeks todo weekno)
    (if (not (null? todo))
      (begin
        (let ( (games (espn-get-games (season.year c) weekno)) )
          (array-set! (season.weeks c) games (1- weekno)))
        (get-weeks (cdr todo) (1+ weekno)))))
  (get-weeks (array->list (season.weeks c)) 1))

(define-method (cache-persist-store (c <season-cache>))
  (define (write-cache) (write-constructor c (current-output-port)))

  (with-output-to-file (season-cache-file (season.year c)) write-cache))

(define-method (cache-read-from-store (c <season-cache>))
  (let ( (cache-file (season-cache-file (season.year c))) )
    (if (file-exists? cache-file)
      ;; (eval (with-input-from-file cache-file read) (current-module))
      (nfldb-eval cache-file)
      #f)))

(define-method (read-season-from-store (year <integer>))
  (let ( (cache-file (season-cache-file year)) )
    (if (file-exists? cache-file)
      (let ( (cache-def (with-input-from-file cache-file read)) )
        (nfldb-eval cache-file))
      #f)))

;;
;; Individual Season Cache
;;

(define-class <schedule-cache> (<nfldb-cache>)
  (seasons      #:init-thunk      make-hash-table
                #:getter          sched.seasons
                #:setter          sched.seasons!)
)

(define-method (cache-sync! (c <schedule-cache>))
  (define (sync-season year season)
    (if (needs-update? season)
      (begin
        (format #t "Synching Schedule cache ~a~%" c)
        (cache-sync! season))))
  (hash-map->list sync-season (sched.seasons c)))

(define schedule-cache-file (format #f "~a/schedules.scm" nfldb-cache-root))

(define-method (cache-persist-store (c <schedule-cache>))
  (with-output-to-file
    schedule-cache-file
    (lambda () (format #t "~a" (hash-map->list _1st (sched.seasons c)))))
  (hash-map->list (lambda (a b) (cache-persist-store b)) (sched.seasons c)))

(define-method (cache-read-from-store (c <schedule-cache>))
  (define (add-season-cache year)
    (hash-set! (sched.seasons c) year (read-season-from-store year)))
  (let ( (years (with-input-from-file schedule-cache-file read)) )
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

(define (add-season year)
  (if (not (hash-ref (sched.seasons (schedule)) year))
    (hash-set! (sched.seasons (schedule)) year (make-instance <season-cache> #:year year))))

(define (get-games year week-no)
  (let ( (season (hash-ref (sched.seasons (schedule)) year)) )
    (if season
      (let ( (weeks (season.weeks season)) )
        (if weeks
          (array-ref weeks (1- week-no))
          #f))
      #f)))

