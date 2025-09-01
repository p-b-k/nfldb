(define-module (bad-cat nfldb cache)

  ;; *******************************************************************************************************************
  ;; Caching datasource that looks up from previous datasource
  ;; *******************************************************************************************************************

  #:use-module (oop goops)

  #:use-module (bad-cat nfldb data)
  #:use-module (bad-cat nfldb espn)

  #:export (cache-datasource-new)
  #:export (cache-datasource-wrap)

  #:export (cache-add-game-for-week)
)

(define seasons (make-hash-table))

(define reg-season-game-count 18)
(define playoff-round-count 4)

(define (get-year-weeks year)
  (let ( (weeks (hash-ref seasons year)) )
    (if weeks
      weeks
      (let ( (new-weeks (make-array #f (+ reg-season-game-count playoff-round-count))) )
        (hash-set! seasons year new-weeks)
        new-weeks))))

(define (cached-games-for-week ds year weekno)
  (let ( (weeks (get-year-weeks year)) )
    (let ( (week-games (array-ref weeks weekno)) )
      (if week-games
        week-games
        (let ( (new-week-games (datasource-get-games ds year weekno)) )
          (array-set! weeks new-week-games weekno)
          new-week-games)))))

;; Add a game to the week hash (used to instantiate data)
(define (cache-add-game-for-week game year weekno)
  (let ( (weeks (get-year-weeks year)) )
    (let ( (week-games (array-ref weeks weekno)) )
      (array-set! weeks (cons game (if week-games week-games '())) weekno))))

;; *********************************************************************************************************************
;; Create the <cache-datasource> object
;; *********************************************************************************************************************

(define-class <cache-datasource> (<datasource>)
  (source       #:init-keyword      #:source
                #:init-thunk        espn-datasource-new
                #:getter            cache.source))

(define (cache-datasource-new) (make-instance <cache-datasource>))
(define (cache-datasource-wrap ds)
  (if (is-a? ds <datasource>)
    (make-instance <cache-datasource> #:source ds)
    (throw 'cache-datasource-must-wrap-datasource (class-name (class-of ds)))))

(define-method (datasource-get-games (ds <cache-datasource>) (year <integer>) (weekno <integer>))
  (cached-games-for-week (cache.source ds) year weekno))


