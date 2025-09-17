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
; #:use-module (bad-cat nfldb game)
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

(define (json->game-data game-id game-json)
  (define (print-scoring-play scoring-play-json)
    (format #t "Q~d :  ~2d - ~2a : ~a~%"
            (json-ref period.number scoring-play-json)
            (json-ref awayScore scoring-play-json)
            (json-ref homeScore scoring-play-json)
            (json-ref type.text scoring-play-json)))
  (define (print-drive-counts drive-no todo)
    (if (not (null? todo))
      (let ( (next-drive (car todo)) )
        (format #t "~2d : Play count ~a~%" drive-no (length (json-ref plays next-drive)))
        (print-drive-counts (1+ drive-no) (cdr todo)))))
  (let ( (scoring-plays (json-ref scoringPlays game-json))
         (drives (json-ref drives.previous game-json))
         (name (format #f "~a @ ~a" (json-ref boxscore.teams.0.team.name game-json)
                       (json-ref boxscore.teams.1.team.name game-json))) )
    (format #t "The game ~a had ~a scoring plays and ~a drives~%" name (length scoring-plays) (length drives))
    (format #t "SCORING PLAYS~%")
    (map print-scoring-play scoring-plays)
    (format #t "DRIVES~%")
    (print-drive-counts 0 drives)))

;;
;;
;;

