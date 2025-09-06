(define-module (bad-cat nfldb cache)

  ;; *******************************************************************************************************************
  ;; Create a root cache object
  ;; *******************************************************************************************************************

  #:use-module (oop goops)

  #:use-module (bad-cat nfldb cache)

  ;; Root class of caches

  #:export (<nfldb-cache>)

  ;; Public access methods

  #:export (mark-dirty!)          ;; Force a cache to reload from outside
  #:export (needs-update?)        ;; Does the cache need to be synched with outside?
  #:export (sync! cache)          ;; Retrieve updates from outside

  #:export (persist cache)        ;; Write the cache to disk
  #:export (restore cache)        ;; Restore the cache from disk

  #:export (nfldb-cache-root)     ;; The root of the cache store

  ;; Methods to be implemented

  #:export (cache-out-of-date?)
  #:export (cache-sync!)

  #:export (cache-read-from-store)
  #:export (cache-persist-store)
)

(define-class <nfldb-cache> ()
  (need-update       #:init-form          #t
                     #:getter             cache.dirty?
                     #:setter             cache.dirty!)
)

(define-method (cache-out-of-date? (c <nfldb-cache>)) #f)
(define-method (cache-sync! (c <nfldb-cache>))
  (format #t "cache-sync! <nfldb-cache> : synching cache ~a~%" (class-name (class-of cache)))
  #t)
(define-method (cache-persist-store (c <nfldb-cache>)) #f)

(define-method (cache-read-from-store (c <nfldb-cache>)) #f)

(define nfldb-cache-root (format #f "./cache"))

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
      (begin
        (if (cache-sync! cache)
          (begin
            (cache.dirty! cache #f)
            #t)
          (throw 'unable-to-sync-cache cache)))
      #f)
    (throw 'sync! 'mark-dirty! cache (class-name (class-of cache)))))

(define (persist cache)
  "Write the cache to disk"
  (if (not (cache-persist-store cache)) (throw 'unable-to-persist-cache))
  #t)

(define (restore cache)
  "Restore the cache from disk"
  (if (not (cache-read-from-store cache)) (throw 'unable-to-restore-cache))
  #t)

