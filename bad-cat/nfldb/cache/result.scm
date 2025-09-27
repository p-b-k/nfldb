(define-module (bad-cat nfldb cache result)

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

  #:export (game-result-store)
  #:export (game-result-restore)
  #:export (game-result-retrieve)
  #:export (game.result)
  #:export (update-game-result)

  #:export (play-type->text)
)

(define (game-cache-file game-id) (format #f "~a/games/game_~a.scm" nfldb-cache-root game-id))

(define type-cache-file (format #f "~a/play-types.scm" nfldb-cache-root))

;; ---------------------------------------------------------------------------------------------------------------------
;; Type Name Cache
;; ---------------------------------------------------------------------------------------------------------------------

(define (type-cache-restore)
  (if (file-exists? type-cache-file) (nfldb-eval (with-input-from-file type-cache-file read)) (make-hash-table)))

(define play-type-cache (type-cache-restore))

(define (type-cache-store)
  (with-output-to-file type-cache-file (lambda () (write-constructor play-type-cache (current-output-port)))))

(define (play-type->text type-id)
  (hash-ref play-type-cache type-id))

(define (play-type->text! type-id type-text)
  (format #t "play-type->text!: setting type-id ~3a to ~64a~%" type-id type-text)
  (hash-set! play-type-cache type-id type-text)
  (type-cache-store))

;; ---------------------------------------------------------------------------------------------------------------------
;; Result Store Cache
;; ---------------------------------------------------------------------------------------------------------------------

(define (game-result-store game-result )
  (if game-result 
    (let ( (game-id (game.id game-result )) )
      (with-output-to-file
        (game-cache-file game-id)
        (lambda () (write-constructor game-result (current-output-port)))))))

(define (game-result-restore game-id)
  (let ( (cache-file (game-cache-file game-id)) )
    (if (file-exists? cache-file)
      (nfldb-eval (with-input-from-file cache-file read))
      #f)))

(define (game-result-retrieve game-id)
  (let ( (game-json (get-game-data game-id)) )
    (format #t "Trying game data for game ~a~%" game-id)
    (if game-json
      (json->game-data game-id game-json)
      #f)))

(define (get-game-url game-id)
  (format #f "https://site.api.espn.com/apis/site/v2/sports/football/nfl/summary?event=~a" game-id))

(define (get-game-data game-id)
  (espn-get-url (get-game-url game-id) port->json-obj))

(define (json->game-data game-id game-json)
  (define (json->play team-id play-json)
    (let ( (quarter     (1- (json-ref period.number play-json)))
           (type-id     (string->number (json-ref type.id play-json)))
           (type-text   (json-ref type.text play-json))
           (play-id     (string->number (json-ref id play-json)))
           (play-text   (json-ref text play-json))
           (play-down   (json-ref end.down play-json))
           (play-togo   (json-ref end.distance play-json))
           (play-start  (json-ref start.yardLine play-json))
           (play-end    (json-ref end.yardLine play-json))
           (play-yards  (json-ref statYardage play-json)) )
      (if (not (play-type->text type-id)) (play-type->text! type-id type-text))
      (make-game-play play-id team-id quarter type-id play-text play-down play-togo play-start play-end play-yards)))
  (define (json->scoring-play play-json)
    (let ( (play-id     (string->number (json-ref id play-json)))
           (type-id     (string->number (json-ref type.id play-json)))
           (away-score  (json-ref awayScore play-json))
           (home-score  (json-ref homeScore play-json)) )
      (make-scoring-play play-id type-id away-score home-score)))
  (define (json-list->drives drive-no todo sofar)
    (if (null? todo)
      (reverse sofar)
      (let ( (drive-json (car todo)) )
        (let ( (team-id (string->number (json-ref team.id drive-json)))
               (start-clock   (clock->pair (json-ref start.clock.displayValue drive-json)))
               (time-clock    (clock->pair (json-ref timeElapsed.displayValue drive-json)))
               (start-pos     (json-ref start.yardLine drive-json))
               (end-pos       (json-ref end.yardLine drive-json))
               (result        (json-ref displayResult drive-json)) )
          (let ( (plays (map (lambda (x) (json->play team-id x))
                             (json-ref plays drive-json))) )
            (let ( (drive (make-drive team-id start-clock time-clock start-pos end-pos result plays)) )
              (json-list->drives (1+ drive-no) (cdr todo) (cons drive sofar))))))))
  (let ( (name (format #f "~a@~a" (json-ref boxscore.teams.0.team.name game-json)
                         (json-ref boxscore.teams.1.team.name game-json))) )
    (if (member 'scoringPlays (json-keys game-json))
      (let ( (scoring-plays-json (json-ref scoringPlays game-json))
             (drives-json (json-ref drives.previous game-json)) )
        (define (get-final-score)
          (let ( (last-score-json (car (reverse scoring-plays-json))) )
            (cons (json-ref awayScore last-score-json) (json-ref homeScore last-score-json))))
        (format #t "The game ~a had ~a scoring plays and ~a drives~%"
                name (length scoring-plays-json) (length drives-json))
        (let ( (final (get-final-score))
               (scoring-plays (map json->scoring-play scoring-plays-json))
               (drives (json-list->drives 0 drives-json '())) )
          (make-game-data game-id (car final) (cdr final) scoring-plays drives)))
      (begin
        (format #t "The game ~a has not been played yet~%" name)
        #f))))

(define-method (game.result (g <boolean>)) (not g))

(define-method (game.result (g <nfl-game>))
  (let ( (cached-details (slot-ref g 'game-result )) )
    (if cached-details
      cached-details
      (let ( (fresh-details (game-result-restore (game.id g))) )
        (if fresh-details
          (begin
            (slot-set! g 'game-result  fresh-details)
            fresh-details)
          #f)))))

(define-method (update-game-result (g <nfl-game>))
  (let ( (cache-file (game-cache-file (game.id g))) )
    (if (not (file-exists? cache-file))
      (let ( (game (game-result-retrieve (game.id g))) )
        (if game
          (begin
            (format #t "update data getting details for ~a~%" (game.name g))
            (game-result-store game)))))))

