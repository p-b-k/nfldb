(define-module (bad-cat nfldb game)

  ;; *******************************************************************************************************************
  ;; Define the game object and associated methods
  ;; *******************************************************************************************************************

  #:use-module (oop goops)

  #:use-module (bad-cat utils)

  #:export (<nfl-game>)

  #:export (game.time)
  #:export (game.home)
  #:export (game.away)

  #:export (game-date<?)

  #:export (games-for-week)
)

(define-class <nfl-game> ()
  (espn-id            #:init-keyword      #:id
                      #:getter            game.id)
  (game-year          #:init-keyword      #:year
                      #:getter            game.year)
  (game-week          #:init-keyword      #:week
                      #:getter            game.week)
  (game-time          #:init-keyword      #:time
                      #:getter            game.time)
  (home-team          #:init-keyword      #:home
                      #:getter            game.home)
  (away-team          #:init-keyword      #:away
                      #:getter            game.away)
)

(define-method (write (g <nfl-game>) (o <output-port>))
  (format o "[~2,'0d: ~a @ ~a]" (1+ (game.week g)) (game.away g) (game.home g)))

(define-method (game-date<? (g1 <nfl-game>) (g2 <nfl-game>)) (gametime<? (game.time g1) (game.time g2)))

