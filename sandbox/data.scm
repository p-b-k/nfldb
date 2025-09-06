;; *********************************************************************************************************************
;; Test new caching system
;; *********************************************************************************************************************

(use-modules (oop goops))

(use-modules (bad-cat nfldb cache))
(use-modules (bad-cat nfldb cache league))

(use-modules (bad-cat nfldb team))
(use-modules (bad-cat utils))

(define league-cache ((@@ (bad-cat nfldb cache league) league)))

(cache-read-from-store league-cache)

