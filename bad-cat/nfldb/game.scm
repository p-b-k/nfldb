(define-module (bad-cat nfldb game)

  ;; *******************************************************************************************************************
  ;; Define the game object and associated methods
  ;; *******************************************************************************************************************

  #:use-module (oop goops)

  #:use-module (bad-cat utils)

  #:export (<nfl-game>)
  #:export (<nfl-game-result>)
  #:export (<nfl-game-drive>)
  #:export (<nfl-game-play>)
  #:export (<nfl-scoring-play>)
  #:export (<nfl-play-type>)

  #:export (game.id)
  #:export (game.name)
  #:export (game.short-name)
  #:export (game.year)
  #:export (game.week)
  #:export (game.time)
  #:export (game.home)
  #:export (game.away)
  #:export (game.teams)

  #:export (result.home)
  #:export (result.away)
  #:export (result.scores)
  #:export (result.drives)

  #:export (game-date<?)

  #:export (games-for-week)

  #:export (make-game-data)
  #:export (make-game-play)
  #:export (make-scoring-play)
  #:export (make-drive)

  #:export (game-tied?)
  #:export (game-winner?)

  #:export (result-plays)
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
  (game-result        #:init-form         #f)
)

;; Detailed data for a game
(define-class <nfl-game-result> ()
  (espn-id            #:init-keyword      #:id
                      #:getter            game.id)
  (away-score         #:init-keyword      #:away
                      #:getter            result.away)
  (home-score         #:init-keyword      #:home
                      #:getter            result.home)
  (scoringPlays       #:init-keyword      #:scores
                      #:getter            result.scores)
  (drives             #:init-keyword      #:drives
                      #:getter            result.drives)
)

(define (make-game-data game-id away-score home-score scoringPlays drives)
  (make-instance <nfl-game-result>
                 #:id         game-id
                 #:home       home-score
                 #:away       away-score
                 #:scores     scoringPlays
                 #:drives     drives))

;; Details about a drive
(define-class <nfl-game-drive> ()
  (team-id            #:init-keyword      #:team)
  (start-clock        #:init-keyword      #:start-clock)
  (time-clock         #:init-keyword      #:time-clock)
  (start-position     #:init-keyword      #:start-pos)
  (end-position       #:init-keyword      #:end-pos)
  (plays              #:init-keyword      #:plays)
  (result             #:init-keyword      #:result)
)

(define (result-plays result) (apply append (map (lambda (x) (slot-ref x 'plays)) (result.drives result))))

(define (make-drive team-id start-clock time-clock start-pos end-pos result plays)
  (make-instance <nfl-game-drive>
                 #:team           team-id
                 #:start-clock    start-clock
                 #:time-clock     time-clock
                 #:start-pos      start-pos
                 #:end-pos        end-pos
                 #:result         result
                 #:plays          plays))

;; Root class of a play
(define-class <nfl-game-play> ()
  (play-id            #:init-keyword      #:play-id)
  (team-id            #:init-keyword      #:team-id)
  (drive              #:init-keyword      #:drive)
  (type-id            #:init-keyword      #:type-id)
  (text               #:init-keyword      #:text)
  (down               #:init-keyword      #:down)
  (yds-to-go          #:init-keyword      #:yds-to-go)
  (start-position     #:init-keyword      #:start-position)
  (end-position       #:init-keyword      #:end-position)
  (yards              #:init-keyword      #:yards)
)

(define (make-game-play play-id team-id drive-no type-id text down togo start end yards)
  (make-instance <nfl-game-play>
                 #:play-id        play-id
                 #:team-id        team-id
                 #:drive          drive-no
                 #:type-id        type-id
                 #:text           text
                 #:down           down
                 #:yds-to-go      togo
                 #:start-position start
                 #:end-position   end
                 #:yards          yards))

;; Scoring play
(define-class <nfl-scoring-play> ()
  (play-id            #:init-keyword      #:play-id)
  (type-id            #:init-keyword      #:type-id)
  (away-score         #:init-keyword      #:away-score)
  (home-score         #:init-keyword      #:home-score)
)

(define (make-scoring-play play-id type-id away-score home-score)
  (make-instance <nfl-scoring-play>
                 #:play-id    play-id
                 #:type-id    type-id
                 #:away-score away-score
                 #:home-score home-score))

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

(define-method (game-tied? (r <nfl-game-result>)) (eq? (result.home r) (result.away r)))

(define-method (game-winner? (g <nfl-game>) (r <nfl-game-result>) (team <symbol>))
  (if (< (result.home r) (result.away r))
    (eq? team (game.away g))
    (eq? team (game.home g))))
