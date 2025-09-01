(define-module (bad-cat nfldb schedule)

  ;; *******************************************************************************************************************
  ;; A Place to put various schedule related functions
  ;; *******************************************************************************************************************

  #:use-module (bad-cat nfldb data)
  #:use-module (bad-cat nfldb game)
  #:use-module (bad-cat nfldb team)

  #:export (current-seaason)
  #:export (get-week)
  #:export (get-week-teams)
  #:export (get-week-byes)
)

(define current-season (make-parameter 2025))

(define (get-week week-no) (ds-get-games (current-season) week-no))

(define (get-week-teams year week-no)
  (apply append (map game.teams (ds-get-games year week-no))))

(define (get-week-byes year week-no)
  (let ( (all-teams (map team.nick (all-nfl-teams)))
         (playing-teams (get-week-teams year week-no)) )
    (define (test x) (not (member x playing-teams)))
    (filter test all-teams)))


