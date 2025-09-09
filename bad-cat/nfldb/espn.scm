(define-module (bad-cat nfldb espn)

  ;; *******************************************************************************************************************
  ;; Tools to get data from ESPN api
  ;; *******************************************************************************************************************

  #:use-module (oop goops)
  #:use-module (srfi srfi-19)

  #:use-module (web client)
  #:use-module (web response)

  #:use-module (bad-cat utils)
  #:use-module (bad-cat nfldb json)

  #:export (espn-get-url)
  #:export (espn-get-page)

  #:export (espn-host-core)
  #:export (espn-host-cdn)

  #:export (read-espn-color)
  #:export (read-espn-gametime)
  #:export (lookup-division)

  #:export (<espn-object>)
)

(define espn-host-core "sports.core.api.espn.com")
(define espn-host-cdn "cdn.espn.com")

(define (espn-get-url url proc)
  (format #t "#### URL  : ~a~%" url)
  (let ( (res (http-get url #:streaming? #t)) )
;   (format #t "#### RES  : ~a~%" res)
    (if (eq? 200 (response-code res))
      (let ( (data (proc (response-body-port res))) )
        data)
      (throw 'connection-failed (response-code res) (response-reason-phrase res)))))

(define (espn-get-page host path proc)
  (espn-get-url (format #f "https://~a/~a" host path) proc))

(define (read-espn-color color-string)
  (let ( (r (string->number (format #f "#x~a" (substring color-string 0 2))))
         (g (string->number (format #f "#x~a" (substring color-string 2 4))))
         (b (string->number (format #f "#x~a" (substring color-string 4 6)))) )
    (make-instance <rgb-color> #:r r #:g g #:b b)))

(define url-map (make-hash-table))

(define (lookup-division url)
; (format #t "lookup-division: calling on ~a (cached? ~a)~%" url (hash-ref url-map url))
  (let ( (cached (hash-ref url-map url)) )
    (if cached
      cached
      (let ( (div-json (espn-get-url url port->json-obj)) )
        (let ( (conf-url (json-ref parent.$ref div-json)) )
          (let ( (conf-json (espn-get-url conf-url port->json-obj)) )
            (let ( (pair (cons (string->symbol (json-ref abbreviation conf-json))
                               (string->symbol (json-ref abbreviation div-json)))) )
              (hash-set! url-map url pair)
              pair)))))))

(define (tz-offset) -4)
(define espn-date-fmt "~Y-~m-~dT~H:~MZ")

(define (read-espn-gametime date-string)
  (let ( (utc-date (string->date date-string espn-date-fmt)) )
;   (format #t "~s => ~a~%" date-string utc-date)
    (secs->gametime (time-second (date->time-utc (hour+ (date->time-utc utc-date) (tz-offset)))))))

(define-class <espn-object> ()
  (espn-id        #:init-form       #:espn-id)
)
