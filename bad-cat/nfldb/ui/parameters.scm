(define-module (bad-cat nfldb ui parameters)

  ;; *******************************************************************************************************************
  ;; 
  ;; *******************************************************************************************************************

  #:export (endzone-width)
  #:export (yard-width)
  #:export (field-width)
  #:export (play-panel-width)
  #:export (drive-panel-width)
  #:export (drive-height)
)

(define endzone-width         (make-parameter 50))
(define yard-width            (make-parameter 5))

(define (field-width) (* 100 (yard-width)))
(define (play-panel-width) (+ (* 2 (endzone-width)) (field-width)))
(define drive-panel-width (make-parameter 80))

(define drive-height (make-parameter 400))

