(define-module (bad-cat nfldb schedule)

  ;; *******************************************************************************************************************
  ;; A Place to put various schedule related functions
  ;; *******************************************************************************************************************

  #:use-module (bad-cat utils)
  #:use-module (bad-cat nfldb game)
  #:use-module (bad-cat nfldb team)

  #:use-module (bad-cat nfldb cache schedule)
  #:use-module (bad-cat nfldb cache league)

  #:export (current-seaason)
  #:export (get-week)
  #:export (get-week-teams)
  #:export (get-week-byes)
  #:export (get-next-game)
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

(define (get-next-game team)
  (define (find-teams-game games)
    (if (null? games)
      #f
      (if (or (eq? team (game.home (car games))) (eq? team (game.away (car games))))
        (car games)
        (find-teams-game (cdr games)))))
  (define (check-week week-no last-game)
    (if (> week-no 18)
      #f
      (let ( (weeks-games (get-games (current-season) week-no)) )
        (let ( (teams-game (find-teams-game weeks-games)) )
          (if teams-game
            (let ( (gametime (game.time teams-game)) )
              (if (< (gametime->secs gametime) (current-time))
                (check-week (1+ week-no) teams-game)
                teams-game))
            (check-week (1+ week-no) last-game))))))
  (check-week 1 #f))


