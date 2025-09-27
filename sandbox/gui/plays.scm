;; *********************************************************************************************************************
;; Test accessing data, parsing json, etc, from espn nfl api
;; *********************************************************************************************************************

(use-modules (oop goops))
(use-modules (srfi srfi-19))

(use-modules (g-golf))

(use-modules (bad-cat utils))
(use-modules (bad-cat nfldb))

(use-modules (bad-cat nfldb ui init))
(use-modules (bad-cat nfldb data))
(use-modules (bad-cat nfldb game))

(use-modules (bad-cat nfldb cache schedule))
(use-modules (bad-cat nfldb cache result))

(use-modules (bad-cat nfldb ui panels gamegraph))

(define calc-play-height (@@ (bad-cat nfldb ui panels gamegraph) calc-play-height))

(define g (car (get-games 2025 1)))
(define r (game.result g))

;; *********************************************************************************************************************
;; Startup Hook
;; *********************************************************************************************************************
(define (show-game-graph-window app game result)
  (let ( (window (make-instance <gtk-application-window>
                                      #:title (format #f "Overview: ~a" (game.name game))
                                      #:icon "/bad-cat/nfldb/NFL"
                                      #:application app)) )

    (gtk-style-context-add-provider-for-display (gdk-display-get-default) nfldb-css-provider 0)

    (set-child window (create-game-details-panel game result))

    (present window)))


;; *********************************************************************************************************************
;; Main entry point to start UI
;; *********************************************************************************************************************

(define (nfldb-show-game-graph game result)
  (define (proc app) (show-game-graph-window app game result))
  (if (not (is-a? game <nfl-game>)) (throw 'invalid-type 'game (class-name <nfl-game>) (class-name (class-of game))))
  (if (not (is-a? result <nfl-game-result>))
  (throw 'invalid-type 'result (class-name <nfl-game-result>) (class-name (class-of result))))
  (let ( (app (make <gtk-application> #:application-id "bad-cat.nfldb.game-graph")) )
    (connect app 'activate proc)
    (g-application-run app '())))

;; More user friendly wrapper
(define (nfldb-show-game-graph-for-team-in-week team-nick week)
  (define (find-game-with-team games)
    (if (null? games)
      #f
      (let ( (next-game (car games)) )
        (if (member team-nick (list (game.home next-game) (game.away next-game)))
          next-game
          (find-game-with-team (cdr games))))))
  (let ( (game (find-game-with-team (get-games (current-season) week))) )
    (if game
      (let ( (result (game.result game)) )
        (if result
          (nfldb-show-game-graph game result)
          (format #t "The result of game ~a has not been recored yet~%" (game.name game))))
      (format #t "It does not appear that ~a has any games in week ~a~%" team-nick week))))


(define (map-type-defs proc)
  (let ( (types (nfldb-eval (with-input-from-file "cache/play-types.scm" read))) )
    (let ( (ids (sort (hash-map->list _1st types) <)) )
      (map (lambda (x) (proc x (hash-ref types x))) ids))))

(define (schemify-name name)
  (define (proc todo sofar)
    (if (null? todo)
      (list->string (reverse sofar))
      (let ( (next (car todo)) )
        (cond
          ( (char-whitespace? next)
            (proc (cdr todo) (cons #\- sofar)) )
          ( (char-upper-case? next)
            (proc (cdr todo) (cons (char-downcase next) sofar)) )
          ( (or (char-alphabetic? next) (char-numeric? next))
            (proc (cdr todo) (cons (char-downcase next) sofar)) )
          ( #t (proc (cdr todo) sofar) )))))
  (proc (string->list name) (reverse (string->list "nfldb-play-type-"))))

(define (write-type-defs)
  (define (write-type-def id text)
    (format #t ";; ~a~%" text)
    (format #t "(define ~48a ~4,' d)~%" (schemify-name text) id)
;   (format #t "~%")
  )
  (map-type-defs write-type-def))

