(define-module (bad-cat nfldb)

  ;; *******************************************************************************************************************
  ;; Module to evaluate serialization expressions in
  ;; *******************************************************************************************************************

  #:use-module (oop goops)

  #:use-module (bad-cat nfldb cache)

  #:use-module (bad-cat nfldb cache league)
  #:use-module (bad-cat nfldb cache schedule)

  #:use-module (bad-cat nfldb team)
  #:use-module (bad-cat nfldb game)
  #:use-module (bad-cat utils)

  #:export (nfldb-eval)
  #:export (current-season)
)

(define (cons-list->hash l)
  (let ( (h (make-hash-table)) )
    (define (add-items todo)
      (if (null? todo)
        h
        (let ( (next (car todo)) )
          (hash-set! h (car next) (cdr next))
          (add-items (cdr todo)))))
    (add-items l)))

(define (nfldb-eval expr) (eval expr (resolve-module '(bad-cat nfldb))))
(define current-season (make-parameter 2025))

