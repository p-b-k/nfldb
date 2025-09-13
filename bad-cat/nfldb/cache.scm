(define-module (bad-cat nfldb cache)

  ;; *******************************************************************************************************************
  ;; Create a root cache object
  ;; *******************************************************************************************************************

  #:use-module (oop goops)

  ;; Root class of caches

  #:export (<nfldb-cache>)

  ;; Public access methods

  #:export (nfldb-cache-root)     ;; The root of the cache store
)

(define-class <nfldb-cache> ()
  (need-update       #:init-form          #t
                     #:getter             cache.dirty?
                     #:setter             cache.dirty!)
)

(define nfldb-cache-root (format #f "./cache"))

