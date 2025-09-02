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
  #:export (gametime-day-of-week)
  #:export (gametime-day-of-year)
  #:export (gametime<?)
  #:export (gametime-format)

  #:export (<rgb-color>)
  #:export (rgb.r)
  #:export (rgb.g)
  #:export (rgb.b)
  #:export (html-color)
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
  (let* ( (utc-time (make-time time-utc 0 (gametime.secs gt)))
          (utc-date (time-utc->date utc-time)) )
;   (format #t "date = ~a~%" utc-date)
    (slot-set! gt 'time utc-time)
    (slot-set! gt 'date utc-date)))

(define (secs->gametime secs)
; (format #t "secs = ~a~%" secs)
  (make-instance <gametime> #:secs secs))
(define (gametime->secs gt)
  (if (not (is-a? gt <gametime>)) (throw 'invalid-type 'expecting '<gametime> 'got (class-of (class-name gt))))
  (gametime.secs gt))

(define-method (gametime-year         (gt <gametime>)) (date-year     (gametime.date gt)))
(define-method (gametime-month        (gt <gametime>)) (date-month    (gametime.date gt)))
(define-method (gametime-day          (gt <gametime>)) (date-day      (gametime.date gt)))

(define-method (gametime-hour         (gt <gametime>)) (date-hour     (gametime.date gt)))
(define-method (gametime-min          (gt <gametime>)) (date-minute   (gametime.date gt)))
(define-method (gametime-day-of-week  (gt <gametime>)) (date->string  (gametime.date gt) "~A"))
(define-method (gametime-day-of-year  (gt <gametime>)) (date-year-day (gametime.date gt)))

(define-method (gametime<? (gt1 <gametime>) (gt2 <gametime>)) (< (gametime.secs gt1) (gametime.secs gt2)))

(define-method (gametime-format (gt <gametime>) (fmt <string>)) (date->string (gametime.date gt) fmt))

(define-class <rgb-color> ()
  (red      #:init-keyword    #:r
            #:getter          rgb.r
            #:setter          rgb.r!)
  (green    #:init-keyword    #:g
            #:getter          rgb.g
            #:setter          rgb.g!)
  (blue     #:init-keyword    #:b
            #:getter          rgb.b
            #:setter          rgb.b!)
)

(define-method (html-color (c <rgb-color>)) (format #f "#~2,'0x~2,'0x~2,'0x" (rgb.r c) (rgb.g c) (rgb.b c)))

