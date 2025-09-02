(define-module (bad-cat nfldb data)

  ;; *******************************************************************************************************************
  ;; High level data implementation
  ;; *******************************************************************************************************************

  #:use-module (oop goops)

  #:use-module (bad-cat utils)

  #:export (<datasource>)

  #:export (ds-get-games)
  #:export (ds-get-standings)

  #:export (datasource-get-games)
  #:export (datasource-get-standings)

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

(define-method (datasource-get-standings (ds <datasource>) (conf <symbol>) (div <symbol>))
  (format (current-error-port)
          "WARNING: Calling ~a on datasource ~a (~a)~%" 'datasource-get-standings ds (class-name (class-of ds)))
  '())

(define datasource (make-parameter (make-instance <datasource>)))

(define (ds-get-games year weekno)  (datasource-get-games (datasource) year weekno))
(define (ds-get-standings conf div) (datasource-get-standings (datasource) conf div))

(define-method (set-datasource (ds <datasource>)) (datasource ds))

