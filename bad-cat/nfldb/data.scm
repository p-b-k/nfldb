(define-module (bad-cat nfldb data)
  #:use-module (bad-cat nfldb cache league)
  #:use-module (bad-cat nfldb cache schedule)
  #:use-module (bad-cat nfldb cache standings)
)

;; *********************************************************************************************************************
;; Load cached data
;; *********************************************************************************************************************

(league-restore)
(schedule-restore)
(standings-restore)

