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
  #:use-module (bad-cat nfldb ui parameters)

  #:export (create-game-details-panel)
)

(define (calc-play-height result) (apply + (map (lambda (p)
                                                  (play-renderer-height
                                                    (play-type->renderer
                                                      (slot-ref p 'type-id))))
                                                (result-plays result))))

(define (create-game-details-panel game result)
  (define (get-play-panel)
    (let ( (panel (make-instance <gtk-drawing-area>
                                 #:content-height (calc-play-height result)
                                 #:content-width  (play-panel-width))) )
      (let ( (draw-func (make-game-play-draw-func game result)) )
        (gtk-drawing-area-set-draw-func panel draw-func #f #f))
      panel))
  (define (get-drive-panel)
    (let ( (panel (make-instance <gtk-drawing-area>
                                 #:content-height (drive-height)
                                 #:content-width  (drive-panel-width))) )
      (let ( (draw-func (make-game-drive-draw-func game result)) )
        (gtk-drawing-area-set-draw-func panel draw-func #f #f))
      panel))
  (let ( (play-panel (get-play-panel))
         (drive-panel (get-drive-panel)) )
    (let ( (play-scroll (make-instance <gtk-scrolled-window>)) )
      (let ( (root-hbox (make-instance <gtk-box> #:orientation 'horizontal #:homogeneous #f)) )
        (gtk-scrolled-window-set-child play-scroll play-panel)

        (slot-set! play-scroll 'hexpand #t)
        (slot-set! play-scroll 'css-classes '("game-graph" "play-graph"))
        (slot-set! play-scroll 'min-content-width (play-panel-width))
        (slot-set! drive-panel 'hexpand #f)
        (slot-set! drive-panel 'css-classes '("game-graph" "drive-graph"))

        (gtk-box-append root-hbox play-scroll)
        (gtk-box-append root-hbox drive-panel)

        root-hbox))))

