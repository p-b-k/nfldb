(define-module (bad-cat nfldb cache game-details)

  ;; *******************************************************************************************************************
  ;; Cache for Schedule data
  ;; Very static. Might change if a game gets flexed
  ;; *******************************************************************************************************************

  #:use-module (oop goops)

; #:use-module (bad-cat utils)
; #:use-module (bad-cat nfldb)
; #:use-module (bad-cat nfldb cache)
  #:use-module (bad-cat nfldb espn)
; #:use-module (bad-cat nfldb team)
  #:use-module (bad-cat nfldb json)
  #:use-module (bad-cat nfldb game)
; #:use-module (bad-cat nfldb serialize)

  #:use-module (bad-cat nfldb cache league)

; #:export (<season-cache>)
; #:export (<schedule-cache>)

; #:export (schedule-restore)
; #:export (schedule-store)
  #:export (game-details-retrieve)

; #:export (add-season)
; #:export (get-games)
)

(define (game-details-retrieve game-id)
  (let ( (game-json (get-game-data game-id)) )
    (if game-json
      (json->game-data game-id game-json)
      #f)))

(define (get-game-url game-id)
  (format #f "https://site.api.espn.com/apis/site/v2/sports/football/nfl/summary?event=~a" game-id))

(define (get-game-data game-id)
  (espn-get-url (get-game-url game-id) port->json-obj))

; (define (construct-scoring-play

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
        (format #t "drive-json keys: ~a~%" (json-keys (json-ref end drive-json)))
        (let ( (team-id (string->number (json-ref team.id drive-json)))
               (start-clock   (clock->pair (json-ref start.clock.displayValue drive-json)))
               (time-clock    (clock->pair (json-ref timeElapsed.displayValue drive-json)))
               (start-pos     (json-ref start.yardLine drive-json))
               (end-pos       (json-ref end.yardLine drive-json))
               (result        (json-ref displayResult drive-json))
               (plays         (map json->play (json-ref plays drive-json))) )
          (let ( (drive (make-drive team-id start-clock time-clock start-pos end-pos result plays)) )
            (json-list->drives (1+ drive-no) (cdr todo) (cons drive sofar)))))))
  (let ( (scoring-plays (json-ref scoringPlays game-json))
         (drives (json-ref drives.previous game-json))
         (name (format #f "~a @ ~a" (json-ref boxscore.teams.0.team.name game-json)
                       (json-ref boxscore.teams.1.team.name game-json))) )
    (format #t "The game ~a had ~a scoring plays and ~a drives~%" name (length scoring-plays) (length drives))
    (make-game-data game-id (map json->play scoring-plays) (json-list->drives 0 drives '()))))

;;
;;
;;

