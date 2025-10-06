(define-module (bad-cat nfldb ui parameters)

  ;; *******************************************************************************************************************
  ;; 
  ;; *******************************************************************************************************************

  #:export (endzone-width)
  #:export (yard-width)

  #:export (drive-panel-width)
  #:export (drive-height)

  #:export (play-bar-height)
  #:export (play-bar-stroke-width)
  #:export (play-bar-margin)
  #:export (play-bar-bulb)

  #:export (field-width)
  #:export (play-panel-width)
  #:export (play-bar-total-height)

  #:export (hacky-pi)

  #:export (yds-to-go-stroke-width)

  #:export (drive-break-4-mins)
  #:export (drive-break-2-mins)
)

;;
;; Parameters
;;

;; Width
(define endzone-width           (make-parameter 50))
(define yard-width              (make-parameter 5))

;; Drives
(define drive-panel-width       (make-parameter 80))
(define drive-height            (make-parameter 400))

;; Plays
(define play-bar-height         (make-parameter 3))
(define play-bar-stroke-width   (make-parameter 2))
(define play-bar-margin         (make-parameter 12))
(define play-bar-bulb           (make-parameter 8))

(define yds-to-go-stroke-width  (make-parameter 2))

;;
;; Functions dependant on parameers
;;

(define (field-width)           (* 100 (yard-width)))
(define (play-panel-width)      (+ (* 2 (endzone-width)) (field-width)))
(define (play-bar-total-height) (+ (* 2 (+ (play-bar-margin) (play-bar-stroke-width))) (play-bar-height)))

;; There's got to be a better way
(define (hacky-pi) 3.14159)

;; Drive quarter and half break sizes
(define drive-break-4-mins      (make-parameter 2))
(define drive-break-2-mins      (make-parameter 10))

