(define-module (bad-cat nfldb data)

  ;; *******************************************************************************************************************
  ;; High level data implementation
  ;; *******************************************************************************************************************

  #:use-module (oop goops)

  #:use-module (bad-cat utils)

  #:export (<datasource>)
  #:export (ds-get-games)
  #:export (datasource-get-games)

  #:export (set-datasource)
)

(define-class <datasource> ())

;;
;; Default Method Implementations
;; 

(define-method (datasource-get-games (ds <datasource>) (year <integer>) (weekno <integer>))
  (format (current-error-port)
          "WARNING: Calling ~a on datasource ~a (~a)~%" 'datasource-get-games ds (class-name (class-of ds)))
  '())

(define datasource (make-parameter (make-instance <datasource>)))

(define (ds-get-games year weekno) (datasource-get-games (datasource) year weekno))

(define-method (set-datasource (ds <datasource>)) (datasource ds))
                                                         

