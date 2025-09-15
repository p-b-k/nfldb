;; *********************************************************************************************************************
;; Test new caching system
;; *********************************************************************************************************************

(use-modules (oop goops))

(use-modules (bad-cat nfldb cache))

(use-modules (bad-cat nfldb cache league))
(use-modules (bad-cat nfldb cache schedule))
(use-modules (bad-cat nfldb cache standings))

(use-modules (bad-cat utils))

(define league-cache ((@@ (bad-cat nfldb cache league) league)))
(define schedule-cache ((@@ (bad-cat nfldb cache schedule) schedule)))
(define standings-cache ((@@ (bad-cat nfldb cache standings) standings)))

(league-restore)
(schedule-restore)
(standings-restore)

(use-modules (bad-cat nfldb espn))
(use-modules (bad-cat nfldb json))

(define week-1 401772837)
(define week-2 401772510)
(define week-3 401772839)

(define (get-game-url game-id)
  (format #f "https://site.api.espn.com/apis/site/v2/sports/football/nfl/summary?event=~a" game-id))

(define (get-game-data game-id)
  (espn-get-url (get-game-url game-id) port->json-obj))

(define (get-game-score game-id)
  (let ( (game-json (espn-get-url (get-game-url game-id) port->json-obj)) )
    (if (member 'scoringPlays (hash-map->list _1st game-json))
      (let ( (scoring-plays (json-ref scoringPlays game-json)) )
        (if (null? scoring-plays)
          (cons 0 0)
          (let ( (final-scoring-play (car (reverse scoring-plays))) )
            (cons (json-ref awayScore final-scoring-play)
                  (json-ref homeScore final-scoring-play)))))
      #f)))
  

