(define-module (bad-cat nfldb cache result)

  ;; *******************************************************************************************************************
  ;; Cache for the results of a game
  ;; Very static. Might change if a game gets flexed
  ;; *******************************************************************************************************************

  #:use-module (oop goops)

  #:use-module (bad-cat utils)

  #:use-module (bad-cat nfldb cache)
  #:use-module (bad-cat nfldb espn)
  #:use-module (bad-cat nfldb team)
  #:use-module (bad-cat nfldb json)
  #:use-module (bad-cat nfldb game)
)

(define-class <game-cache> (<nfldb-cache>)
  (game       #:init-form     #f
              #:getter        game.game
              #:setter        game.game!)
)

