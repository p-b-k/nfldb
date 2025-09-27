(define-module (bad-cat nfldb ui controls game-drives)

  ;; *******************************************************************************************************************
  ;; Define the function for drawing the game's drives
  ;; *******************************************************************************************************************

  #:export (make-game-drive-draw-func)
)

(define (make-game-drive-draw-func game result)
  (define (draw drawing-area cr-ptr width height user-data)
    (format #t "Drawing Drives~%"))

  draw)
