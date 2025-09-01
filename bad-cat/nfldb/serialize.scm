(define-module (bad-cat nfldb serialize)

  ;; *******************************************************************************************************************
  ;; Define the game object and associated methods
  ;; *******************************************************************************************************************

  #:use-module (oop goops)
  #:use-module (srfi srfi-19)

  #:use-module (bad-cat utils)

  #:export (write-constructor)
)

(define-method (write-constructor obj (out <output-port>))
  (throw 'no-defined-serializer obj (class-name (class-of obj))))

(define-method (write-constructor (s <string>) (out <output-port>)) (format out "~s" s))
(define-method (write-constructor (s <symbol>) (out <output-port>)) (format out "'~a" s))
(define-method (write-constructor (n <number>) (out <output-port>)) (format out "~a" n))
(define-method (write-constructor (t <gametime>)  (out <output-port>))
  (format out "(secs->gametime ~s)" (gametime->secs t)))

(define-method (write-constructor (obj <object>) (out <output-port>))
  (define (write-slot-value slot)
    (let ( (k (slot-definition-init-keyword slot))
           (v (slot-ref obj (slot-definition-name slot))) )
      (format out "               ~16a " k)
      (write-constructor v out)
      (format out "~%")))
  (format out "(make-instance ~a~%" (class-name (class-of obj)))
  (map write-slot-value (class-slots (class-of obj)))
  (format out ")~%"))

