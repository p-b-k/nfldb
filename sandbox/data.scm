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

(define (old-get-game-url game-id)
  (format #f "https://site.api.espn.com/apis/site/v2/sports/football/nfl/summary?event=~a" game-id))

(define (get-game-data game-id)
  (espn-get-url (old-get-game-url game-id) port->json-obj))

(define (get-game-score game-id)
  (let ( (game-json (espn-get-url (old-get-game-url game-id) port->json-obj)) )
    (if (member 'scoringPlays (hash-map->list _1st game-json))
      (let ( (scoring-plays (json-ref scoringPlays game-json)) )
        (if (null? scoring-plays)
          (cons 0 0)
          (let ( (final-scoring-play (car (reverse scoring-plays))) )
            (cons (json-ref awayScore final-scoring-play)
                  (json-ref homeScore final-scoring-play)))))
      #f)))

(define (get-game-plays game-json)
  (apply append (map (lambda (drive) (json-ref plays drive)) (json-ref drives.previous game-json))))

(define (print-plays plays)
  (if (not (null? plays))
    (let ( (type (json-ref type (car plays))) )
      (let ( (id (json-ref id type))
             (abbr (if (member 'abbreviation (json-keys type)) (json-ref abbreviation type) ""))
             (text (json-ref text type)) )
        (format #t "~8a : ~12a : ~a~%" id abbr text)
        (format #t "~8a : ~a~%" "" (json-ref text (car plays)))
        (format #t "~%")
        (print-plays (cdr plays))))))

(use-modules (bad-cat nfldb cache result))
(use-modules (bad-cat nfldb game))
(use-modules (bad-cat nfldb))

(define (update-week-results week-no) (map update-game-result (get-games (current-season) week-no)))

(use-modules (bad-cat nfldb schedule))

(define (drive-map-for-team-in-week func team-nick week-no)
  (let ( (games-for-week (get-games (current-season) week-no)) )
    (let ( (games-for-team (filter (lambda (g) (member team-nick (list (game.home g) (game.away g))))
                                   games-for-week)) )
      (if (null? games-for-team)
        '()
        (if (null? (cdr games-for-team))
          (let ( (game (car games-for-team)) )
            (let ( (result (game.result game)) )
              (if result
                (map func (result.drives result))
                '())))
          (throw 'cant-get-here 'multiple-games-for-team-in-week games-for-team))))))

