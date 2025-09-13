(define-module (bad-cat nfldb cache)

  ;; *******************************************************************************************************************
  ;; Create a root cache object
  ;; *******************************************************************************************************************

  #:use-module (oop goops)

  #:export (nfldb-cache-root)     ;; The root of the cache store
)


(define nfldb-cache-root (format #f "./cache"))

