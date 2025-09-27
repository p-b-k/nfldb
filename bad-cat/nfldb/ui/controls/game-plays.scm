(define-module (bad-cat nfldb ui controls game-plays)

  ;; *******************************************************************************************************************
  ;; Define the function for drawing the game's plays
  ;; *******************************************************************************************************************

  #:export (make-game-play-draw-func)
)

; (define (make-game-play-draw-func game result)
;   (define (draw drawing-area cr-ptr width height user-data)
;     (format #t "Drawing Plays~%"))

;   draw)

(define (make-game-play-draw-func game result)
  (lambda (drawing-area cr-ptr width height user-data)
    (format #t "Drawing Plays~%")))

