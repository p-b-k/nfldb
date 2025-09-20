(define-module (bad-cat nfldb cache game-details)

  ;; *******************************************************************************************************************
  ;; Cache for Schedule data
  ;; Very static. Might change if a game gets flexed
  ;; *******************************************************************************************************************

  #:use-module (oop goops)

; #:use-module (bad-cat utils)
  #:use-module (bad-cat nfldb)
  #:use-module (bad-cat nfldb cache)
  #:use-module (bad-cat nfldb espn)
  #:use-module (bad-cat nfldb json)
  #:use-module (bad-cat nfldb game)
  #:use-module (bad-cat nfldb serialize)

  #:use-module (bad-cat nfldb cache league)

  #:export (game-details-store)
  #:export (game-details-restore)
  #:export (game-details-retrieve)
  #:export (game.details)
  #:export (update-game-details)
)

(define (game-cache-file game-id) (format #f "~a/games/game_~a.scm" nfldb-cache-root game-id))

(define (game-details-store game-details)
  (if game-details
    (let ( (game-id (game.id game-details)) )
      (with-output-to-file
        (game-cache-file game-id)
        (lambda () (write-constructor game-details (current-output-port)))))))

(define (game-details-restore game-id)
  (let ( (cache-file (game-cache-file game-id)) )
    (if (file-exists? cache-file)
      (nfldb-eval (with-input-from-file cache-file read))
      #f)))

(define (game-details-retrieve game-id)
  (let ( (game-json (get-game-data game-id)) )
    (if game-json
      (json->game-data game-id game-json)
      #f)))

(define (get-game-url game-id)
  (format #f "https://site.api.espn.com/apis/site/v2/sports/football/nfl/summary?event=~a" game-id))

(define (get-game-data game-id)
  (espn-get-url (get-game-url game-id) port->json-obj))

(define (json->game-data game-id game-json)
  (define (json->play scoring-play-json)
    (let ( (quarter (1- (json-ref period.number scoring-play-json)))
           (type-id (string->number (json-ref type.id scoring-play-json)))
           (type-text (json-ref type.text scoring-play-json))
           (play-id (string->number (json-ref id scoring-play-json)))
           (play-text (json-ref text scoring-play-json)) )
      (make-game-play play-id quarter type-id play-text)))
  (define (json-list->drives drive-no todo sofar)
    (if (null? todo)
      (reverse sofar)
      (let ( (drive-json (car todo)) )
        (let ( (team-id (string->number (json-ref team.id drive-json)))
               (start-clock   (clock->pair (json-ref start.clock.displayValue drive-json)))
               (time-clock    (clock->pair (json-ref timeElapsed.displayValue drive-json)))
               (start-pos     (json-ref start.yardLine drive-json))
               (end-pos       (json-ref end.yardLine drive-json))
               (result        (json-ref displayResult drive-json))
               (plays         (map json->play (json-ref plays drive-json))) )
          (let ( (drive (make-drive team-id start-clock time-clock start-pos end-pos result plays)) )
            (json-list->drives (1+ drive-no) (cdr todo) (cons drive sofar)))))))
  (let ( (name (format #f "~a@~a" (json-ref boxscore.teams.0.team.name game-json)
                         (json-ref boxscore.teams.1.team.name game-json))) )
    (if (member 'scoringPlays (json-keys game-json))
      (let ( (scoring-plays (json-ref scoringPlays game-json))
             (drives (json-ref drives.previous game-json)) )
        (format #t "The game ~a had ~a scoring plays and ~a drives~%" name (length scoring-plays) (length drives))
        (make-game-data game-id (map json->play scoring-plays) (json-list->drives 0 drives '())))
      (begin
        (format #t "The game ~a has not been played yet~%" name)
        #f))))

(define-method (game.details (g <boolean>)) g)

(define-method (game.details (g <nfl-game>))
  (let ( (cached-details (slot-ref g 'game-details)) )
    (if cached-details
      cached-details
      (let ( (fresh-details (game-details-restore (game.id g))) )
        (if fresh-details
          (begin
            (slot-set! g 'game-details fresh-details)
            fresh-details)
          #f)))))

(define-method (update-game-details (g <nfl-game>))
  (let ( (cache-file (game-cache-file (game.id g))) )
    (if (not (file-exists? cache-file))
      (let ( (game (game-details-retrieve (game.id g))) )
        (if game
          (begin
            (format #t "update data getting details for ~a~%" (game.name g))
            (game-details-store game)))))))

