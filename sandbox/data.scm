;; *********************************************************************************************************************
;; Test new caching system
;; *********************************************************************************************************************

(use-modules (oop goops))

(use-modules (bad-cat nfldb cache))

(use-modules (bad-cat nfldb cache league))
(use-modules (bad-cat nfldb cache schedule))

(use-modules (bad-cat utils))

(define league-cache ((@@ (bad-cat nfldb cache league) league)))
(define schedule-cache ((@@ (bad-cat nfldb cache schedule) schedule)))

(restore league-cache)
(restore schedule-cache)

