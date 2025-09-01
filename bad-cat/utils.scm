(define-module (bad-cat utils)

  ;; *******************************************************************************************************************
  ;; Some common utility methods
  ;; *******************************************************************************************************************

  #:use-module (srfi srfi-19)
  #:use-module (oop goops)

  #:export(_1st)
  #:export(_2nd)
  #:export(hour+)
  
  #:export (<gametime>)
  #:export (secs->gametime)
  #:export (gametime->secs)
  #:export (gametime-year)
  #:export (gametime-month)
  #:export (gametime-day)
  #:export (gametime-hour)
  #:export (gametime-min)
)

(define (_1st a b) a)
(define (_2nd a b) b)

(define (hour+ time hours)
  (let ( (dur (make-time time-duration 0 (* hours 60 60))) )
    (time-utc->date (add-duration time dur))))

(define-class <gametime> ()
  (secs         #:init-keyword  #:secs
                #:getter        gametime.secs)
  (time         #:getter        gametime.time)
  (date         #:getter        gametime.date)
)

(define-method (initialize (gt <gametime>) args)
  (next-method)
  (let ( (utc-time (make-time time-utc (gametime.secs gt) 0)) )
    (slot-set! gt 'time utc-time)
    (slot-set! gt 'date (time-utc->date utc-time))))

(define (secs->gametime secs) (make-instance <gametime> #:secs secs))
(define (gametime->secs gt)
  (if (not (is-a? gt <gametime>)) (throw 'invalid-type 'expecting '<gametime> 'got (class-of (class-name gt))))
  (gametime.secs gt))

(define-method (gametime-year  (gt <gametime>)) (date-year   (gametime.date gt)))
(define-method (gametime-month (gt <gametime>)) (date-month  (gametime.date gt)))
(define-method (gametime-day   (gt <gametime>)) (date-day    (gametime.date gt)))

(define-method (gametime-hour  (gt <gametime>)) (date-hour   (gametime.date gt)))
(define-method (gametime-min   (gt <gametime>)) (date-minute (gametime.date gt)))

