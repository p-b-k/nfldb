;; *********************************************************************************************************************
;; Test accessing data, parsing json, etc, from espn nfl api
;; *********************************************************************************************************************

(use-modules (oop goops))

(use-modules (srfi srfi-19))

(use-modules (g-golf))

(use-modules (data league))
(use-modules (data sched year-2025))
(use-modules (bad-cat nfldb ui init))

(use-modules (bad-cat utils))

; (use-modules (bad-cat nfldb json))
(use-modules (bad-cat nfldb game))
(use-modules (bad-cat nfldb team))
(use-modules (bad-cat nfldb schedule))
; (use-modules (bad-cat nfldb serialize))


(use-modules (bad-cat nfldb data))
; (use-modules (bad-cat nfldb espn))
(use-modules (bad-cat nfldb cache))

(define-class <week-controls> () (games #:init-keyword #:games) games-list)

(define (create-game-tile game)
  (let ( (tile-grid (make-instance <gtk-grid>))
         (home-image (gtk-image-new-from-resource (format #f "/bad-cat/nfldb/~a/logo" (game.home game))))
         (away-image (gtk-image-new-from-resource (format #f "/bad-cat/nfldb/~a/logo" (game.away game))))
         (text-vbox  (make-instance <gtk-box> #:orientation 'vertical #:homogenous #f))
         (name-label (make-instance <gtk-label> #:requested-width 200 #:label (game.short-name game)))
         (date-label (make-instance <gtk-label>
                                    #:requested-width 200
                                    #:label (gametime-format (game.time game) "~A ~b ~e, ~Y")))
         (time-label (make-instance <gtk-label>
                                    #:requested-width 200
                                    #:label (gametime-format (game.time game) "~l:~M ~p"))) )

    (slot-set! home-image 'height-request 64)
    (slot-set! home-image 'width-request 64)
    (slot-set! away-image 'height-request 64)
    (slot-set! away-image 'width-request 64)

    (gtk-grid-attach tile-grid home-image 0 0 1 1)
    (gtk-grid-attach tile-grid away-image 1 0 1 1)


    (gtk-box-append text-vbox name-label)
    (gtk-box-append text-vbox date-label)
    (gtk-box-append text-vbox time-label)
    (gtk-grid-attach tile-grid text-vbox 2 0 1 1)

    tile-grid))

(define-method (initialize (wc <week-controls>) args)
  (next-method)

  (let ( (scrolled (make-instance <gtk-scrolled-window>))
         (list-view (make-instance <gtk-list-box>)) )
    (define (add-game game)
      (let ( (tile (create-game-tile game)) )
        (gtk-list-box-append list-view tile)
        tile))
    (map add-game (slot-ref wc 'games))
    (gtk-scrolled-window-set-child scrolled list-view)
    (slot-set! wc 'games-list scrolled)))

(define (show-week-window app year week)
  (let ( (games (reverse (ds-get-games year week))) )
    (let ( (week-controls (make-instance <week-controls> #:games games))
           (main-vbox (make-instance <gtk-box>
                                     #:orientation 'vertical
                                     #:homogenous #f)) )

      (let ( (scrolled-list (slot-ref week-controls 'games-list)) )
        (gtk-box-append main-vbox scrolled-list)
        (slot-set! scrolled-list 'vexpand #t))
      (let ( (window (make-instance <gtk-application-window>
                                    #:title (format #f "NFLDB ~a week ~a" year week)
                                    #:icon "/bad-cat/nfldb/NFL"
                                    #:application app)) )
        (slot-set! window 'default-height 400)
        (slot-set! window 'default-width 250)
        (set-child window main-vbox)
        (present window)))))

(define (nfldb-show-week year week)
  (let ( (app (make <gtk-application> #:application-id "bad-cat.nfldb.gui")) )
    (define (start-proc a) (show-week-window a year week))
    (connect app 'activate start-proc)
    (g-application-run app '())))

(set-datasource (cache-datasource-new))

