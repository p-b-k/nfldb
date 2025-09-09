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
; (use-modules (bad-cat nfldb espn-datasource))
(use-modules (bad-cat nfldb cache-datasource))

(define-class <week-controls> () (games #:init-keyword #:games) games-list)

(define (create-game-tile game)
  (let ( (tile-grid (make-instance <gtk-grid>))
         (home-image (gtk-image-new-from-resource (format #f "/bad-cat/nfldb/~a/logo" (game.home game))))
         (away-image (gtk-image-new-from-resource (format #f "/bad-cat/nfldb/~a/logo" (game.away game))))
         (text-vbox  (make-instance <gtk-box> #:orientation 'vertical #:homogenous #f))
         (name-label (make-instance <gtk-label> #:requested-width 200 #:label (game.name game)))
         (time-label (make-instance <gtk-label>
                                    #:requested-width 200
                                    #:label (gametime-format (game.time game) "~l:~M ~p"))) )
    (slot-set! home-image 'height-request 48)
    (slot-set! home-image 'width-request  48)
    (slot-set! away-image 'height-request 48)
    (slot-set! away-image 'width-request  48)

    (gtk-grid-attach tile-grid away-image 0 0 1 1)
    (gtk-grid-attach tile-grid home-image 1 0 1 1)

    (slot-set! name-label 'css-classes  '("name-label"))
    (slot-set! time-label 'css-classes  '("time-label"))
    (slot-set! time-label 'halign       4)

    (slot-set! text-vbox  'css-classes  '("game-tile"))
    (slot-set! text-vbox  'halign       4)
    (slot-set! text-vbox 'hexpand       #t)


    (gtk-box-append text-vbox name-label)
    (gtk-box-append text-vbox time-label)
    (gtk-grid-attach tile-grid text-vbox 2 0 1 1)

    tile-grid))

(define-method (initialize (wc <week-controls>) args)
  (next-method)

  (let ( (scrolled (make-instance <gtk-scrolled-window>))
         (list-view (make-instance <gtk-list-box>)) )
    (define (add-games prev-day games)
      (if (not (null? games))
        (let ( (game (car games)) )
          (let ( (curr-day (gametime-day-of-year (game.time game)))
                 (tile (create-game-tile game)) )
              (if (not (eq? prev-day curr-day))
                (let ( (day-label (make-instance <gtk-label>))
                       (date-label (make-instance <gtk-label>)) )
                  (slot-set! day-label 'label (gametime-format (game.time game) "~A"))
                  (slot-set! day-label 'halign 4)
                  (slot-set! date-label 'css-classes '("day-label"))
                  (slot-set! date-label 'label (gametime-format (game.time game) "~b ~e, ~Y"))
                  (slot-set! date-label 'justify 1)
                  (slot-set! date-label 'hexpand #t)
                  (let ( (hbox (make-instance <gtk-box> #:orientation 'horizontal #:homogenous #f)) )
                    (slot-set! hbox 'halign 0)
                    (slot-set! hbox 'css-classes '("day-label"))
                    (gtk-box-append hbox day-label)
                    (gtk-box-append hbox date-label)
                    (gtk-list-box-append list-view hbox))))
              (slot-set! tile 'css-classes '("game-label"))
              (gtk-list-box-append list-view tile)
              (add-games curr-day (cdr games))))))
    (add-games #f (slot-ref wc 'games))
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

        (gtk-style-context-add-provider-for-display (gdk-display-get-default) nfldb-css-provider 0)
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

