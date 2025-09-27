(define-module (bad-cat nfldb ui panels gamegraph)

  ;; *******************************************************************************************************************
  ;; Main Panel with home team info on top and general upcoming games of interest bellow
  ;; *******************************************************************************************************************

  #:use-module (oop goops)
  #:use-module (g-golf)
  #:use-module (cairo)

  #:use-module (bad-cat utils)

; #:use-module (bad-cat nfldb)
  #:use-module (bad-cat nfldb team)
  #:use-module (bad-cat nfldb game)
; #:use-module (bad-cat nfldb schedule)

  #:use-module (bad-cat nfldb cache standings)
  #:use-module (bad-cat nfldb cache result)
  #:use-module (bad-cat nfldb cache schedule)

  #:use-module (bad-cat nfldb ui controls game-drives)
  #:use-module (bad-cat nfldb ui controls game-plays)

  #:export (create-game-details-panel)
)

(define init-play-panel-width (make-parameter 250))
(define init-drive-panel-width (make-parameter 80))

(define init-drive-height (make-parameter 400))
(define (calc-play-height result)
  (define (calc-next-play height todo)
    (if (null? todo)
      height
      (let ( (next (car todo)) )
        (let ( (play-type (slot-ref next 'type-id)) )
          (case play-type
            ;; Kickoffs and punts
            ( (53 34 32 17)
              (calc-next-play (+ 20 height) (cdr todo)) )
            ( (2)   ;; End of quarter
              (calc-next-play (+ 5 height) (cdr todo)) )
            ;; End of half, or end of regulation
            ( (65 79)
              (calc-next-play (+ 10 height) (cdr todo)) )
            ( (66)  ;; End of game
              (calc-next-play height (cdr todo)) )
            ( (8)   ;; Penalty
              (calc-next-play (+ 15 height) (cdr todo)) )
              ;; Timeout
            ( (74 21 75)
              (calc-next-play (+ 15 height) (cdr todo)) )
              ;; Turnover
            ( (29 26 80 18 30 36 39)
              (calc-next-play (+ 30 height) (cdr todo)) )
              ;; You know, normal plays
            ( (5 24 68 3 59 7 52 67 9 60)
              (calc-next-play (+ 25 height) (cdr todo)) )
            ( else (throw 'unknown-play-type play-type (play-type->text play-type)) ))))))
  (calc-next-play 0 (result-plays result)))

(define (create-game-details-panel game result)
  (define (get-play-panel)
    (let ( (panel (make-instance <gtk-drawing-area>
                                 #:content-height (calc-play-height result)
                                 #:content-width  (init-play-panel-width))) )
      (gtk-drawing-area-set-draw-func panel (make-game-play-draw-func game result) #f #f)
      panel))
  (define (get-drive-panel)
    (let ( (panel (make-instance <gtk-drawing-area>
                                 #:content-height (init-drive-height)
                                 #:content-width  (init-drive-panel-width))) )
      (gtk-drawing-area-set-draw-func panel (make-game-drive-draw-func game result) #f #f)
      panel))
  (let ( (play-panel (get-play-panel))
         (drive-panel (get-drive-panel)) )
    (let ( (play-scroll (make-instance <gtk-scrolled-window>)) )
      (let ( (root-hbox (make-instance <gtk-box> #:orientation 'horizontal #:homogeneous #f)) )
        (gtk-scrolled-window-set-child play-scroll play-panel)

        (slot-set! play-scroll 'hexpand #f)
        (slot-set! drive-panel 'hexpand #f)

        root-hbox))))

