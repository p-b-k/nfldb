(define-module (bad-cat nfldb cache)

  ;; *******************************************************************************************************************
  ;; Create a root cache object
  ;; *******************************************************************************************************************

  #:use-module (oop goops)

  #:use-module (bad-cat nfldb cache)

  ;; Root class of caches
  #:export (<nfldb-cache>)

  ;; Public access methods
  #:export (mark-dirty!)
  #:export (needs-update?)
  #:export (sync! cache)

  ;; Methods to be implemented
  #:export (cache-out-of-date?)
  #:export (cache-sync?)
)

(define-class <nfldb-cache> ()
  (need-update       #:init-keyword       #t
                     #:getter             cache.dirty?
                     #:setter             cache.dirty!)
)

(define-method (cache-out-of-date? (c <nfldb-cache>)) #f)
(define-method (cache-sync! (c <nfldb-cache>)) #t)

(define (mark-dirty! cache)
  "Force the cache to update next time it's synched"
  (if (is-a? cache <nfldb-cache>)
    (cache.dirty! cache #t)
    (throw 'invalid-type 'mark-dirty! cache (class-name (class-of cache)))))

(define (needs-update? cache)
  "Check if the cache needs an update, either because it's been marked dirty or because it's out of date"
  (if (is-a? cache <nfldb-cache>)
    (or (cache.dirty? cache) (cache-out-of-date? cache))
    (throw 'needs-update? 'mark-dirty! cache (class-name (class-of cache)))))

(define (sync! cache)
  "Check if the cache needs syncing, and if so sync it and mark it clean"
  (if (is-a? cache <nfldb-cache>)
    (if (needs-update? cache)
      (if (cache-sync! cache)
        (cache.dirty! cache #f)
        (throw 'unable-to-sync-cache cache)))
    (throw 'sync! 'mark-dirty! cache (class-name (class-of cache)))))

