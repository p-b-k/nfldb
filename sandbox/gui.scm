;; *********************************************************************************************************************
;; Test accessing data, parsing json, etc, from espn nfl api
;; *********************************************************************************************************************

(use-modules (oop goops))

(use-modules (web client))
(use-modules (web response))

(use-modules (bad-cat nfldb json))
(use-modules (bad-cat nfldb game))
(use-modules (bad-cat nfldb team))

(use-modules (g-golf))
(use-modules (bad-cat nfldb ui init))


(g-resources-register (g-resource-load (format #f "~a/~a" (getenv "NFLDB_DIR") "nfldb.gresource")))

(define app (make-parameter #f))

(define (open-app app-id)
  (if (app) (throw 'app-already-open (slot-ref (app) 'application-id)))
  (app (make <gtk-application> #:application-id app-id)))

; (define (show-chess-space space)
;   (let ( (app (make <gtk-application> #:application-id "bad-cat.chess.space")) )
;     (connect app 'activate (lambda (app) (open-chess-space-window app space)))
;     (let ( (status (g-application-run app '())) )
;           space)))

