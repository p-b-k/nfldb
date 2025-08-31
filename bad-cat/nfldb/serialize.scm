(define-module (bad-cat nfldb serialize)

  ;; *******************************************************************************************************************
  ;; Define the game object and associated methods
  ;; *******************************************************************************************************************

  #:use-module (oop goops)

  #:export (serialize)
)

(define-method (serialize obj (out <output-port>)) (throw 'no-defined-serializer obj (class-name (class-of obj))))

(define-method (serialize (s <string>) (out <output-port>)) (format out "~s" s))
(define-method (serialize (s <symbol>) (out <output-port>)) (format out "'~a" s))
(define-method (serialize (n <number>) (out <output-port>)) (format out "~a" n))

(define-method (serialize (obj <object>) (out <output-port>))
  (define (write-slot-value slot)
    (let ( (k (slot-definition-init-keyword slot))
           (v (slot-ref obj (slot-definition-name slot))) )
      (format out "               ~16a " k)
      (serialize v out)
      (format out "~%")))
  (format out "(make-instance ~a~%" (class-name (class-of obj)))
  (map write-slot-value (class-slots (class-of obj)))
  (format out ")~%"))

