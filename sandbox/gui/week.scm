;; *********************************************************************************************************************
;; Test accessing data, parsing json, etc, from espn nfl api
;; *********************************************************************************************************************

(use-modules (oop goops))

(use-modules (srfi srfi-19))

(use-modules (g-golf))

(use-modules (bad-cat nfldb data league))
(use-modules (bad-cat nfldb data sched year-2025))
(use-modules (bad-cat nfldb ui init))

; (use-modules (bad-cat nfldb json))
; (use-modules (bad-cat nfldb game))
; (use-modules (bad-cat nfldb team))
; (use-modules (bad-cat nfldb serialize))


(use-modules (bad-cat nfldb data))
; (use-modules (bad-cat nfldb espn))
(use-modules (bad-cat nfldb cache))

(define-class <week-controls> () (games #:init-keyword #:games) games-list)

(define-method (initialize (wc <week-controls>) args)
  (next-method)

  (let ( (scrolled (make-instance <gtk-scrolled-window>))
         (list-view (make-instance <gtk-list-box>)) )
    (define (add-game game)
      (let ( (label (make-instance <gtk-label> #:label (format #f "~a" game))) )
        (gtk-list-box-append list-view label)
        label))
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

