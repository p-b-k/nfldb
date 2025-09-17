(define-module (bad-cat nfldb game)

  ;; *******************************************************************************************************************
  ;; Define the game object and associated methods
  ;; *******************************************************************************************************************

  #:use-module (oop goops)

  #:use-module (bad-cat utils)

  #:export (<nfl-game>)

  #:export (game.id)
  #:export (game.name)
  #:export (game.short-name)
  #:export (game.year)
  #:export (game.week)
  #:export (game.time)
  #:export (game.home)
  #:export (game.away)
  #:export (game.teams)

  #:export (game-date<?)

  #:export (games-for-week)
)

;; Overview data for a game
(define-class <nfl-game> ()
  (espn-id            #:init-keyword      #:id
                      #:getter            game.id)
  (espn-name          #:init-keyword      #:name
                      #:getter            game.name)
  (espn-short-name    #:init-keyword      #:short-name
                      #:getter            game.short-name)
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

;; Detailed data for a game
(define-class <nfl-game-data> ()
  (espn-id            #:init-keyword      #:id
                      #:getter            game.id)
  (scoringPlays       #:init-keyword      #:scores
                      #:getter            game.scores)
  (drives             #:init-keyword      #:drives
                      #:getter            game.drives)
)

;; Details about a drive
(define-class <nfl-game-drive> ()
  (team-id            #:init-keyword      #:team)
  (start              #:init-keyword      #:start)
  (end                #:init-keyword      #:end)
  (plays              #:init-keyword      #:plays)
)

;; Root class of a play
(define-class <nfl-game-play> ()
  (play-id            #:init-keyword      #:play-id)
  (drive              #:init-keyword      #:drive)
  (type-id            #:init-keyword      #:type-id)
  (text               #:init-keyword      #:text)
)

;; Type of plays
(define-class <nfl-play-type> ()
  (id                 #:init-keyword      #:id)
  (text               #:init-keyword      #:text)
  (abbr               #:init-keyword      #:abbr)
)

(define-method (write (g <nfl-game>) (o <output-port>))
  (format o "[~2,'0d: ~a @ ~a]" (1+ (game.week g)) (game.away g) (game.home g)))

(define-method (game-date<? (g1 <nfl-game>) (g2 <nfl-game>)) (gametime<? (game.time g1) (game.time g2)))

(define-method (game.teams (g <nfl-game>)) (list (game.home g) (game.away g)))

