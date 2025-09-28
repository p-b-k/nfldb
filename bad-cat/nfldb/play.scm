(define-module (bad-cat nfldb play)

  ;; *******************************************************************************************************************
  ;; Play related data
  ;; *******************************************************************************************************************
  #:export (nfldb-pt-end-period)
  #:export (nfldb-pt-pass-incompletion)
  #:export (nfldb-pt-rush)
  #:export (nfldb-pt-sack)
  #:export (nfldb-pt-penalty)
  #:export (nfldb-pt-fumble-recovery-own)
  #:export (nfldb-pt-blocked-punt)
  #:export (nfldb-pt-blocked-field-goal)
  #:export (nfldb-pt-timeout)
  #:export (nfldb-pt-pass-reception)
  #:export (nfldb-pt-pass-interception-return)
  #:export (nfldb-pt-fumble-recovery-opponent)
  #:export (nfldb-pt-muffed-punt-recovery-opponent)
  #:export (nfldb-pt-kickoff-return-touchdown)
  #:export (nfldb-pt-punt-return-touchdown)
  #:export (nfldb-pt-interception-return-touchdown)
  #:export (nfldb-pt-fumble-return-touchdown)
  #:export (nfldb-pt-punt)
  #:export (nfldb-pt-kickoff)
  #:export (nfldb-pt-field-goal-good)
  #:export (nfldb-pt-field-goal-missed)
  #:export (nfldb-pt-end-of-half)
  #:export (nfldb-pt-end-of-game)
  #:export (nfldb-pt-passing-touchdown)
  #:export (nfldb-pt-rushing-touchdown)
  #:export (nfldb-pt-official-timeout)
  #:export (nfldb-pt-twominute-warning)
  #:export (nfldb-pt-end-of-regulation)
  #:export (nfldb-pt-sack-opp-fumble-recovery)
)

;;  2 : End Period
;;  3 : Pass Incompletion
;;  5 : Rush
;;  7 : Sack
;;  8 : Penalty
;;  9 : Fumble Recovery (Own)
;; 17 : Blocked Punt
;; 18 : Blocked Field Goal
;; 21 : Timeout
;; 24 : Pass Reception
;; 26 : Pass Interception Return
;; 29 : Fumble Recovery (Opponent)
;; 30 : Muffed Punt Recovery (Opponent)
;; 32 : Kickoff Return Touchdown
;; 34 : Punt Return Touchdown
;; 36 : Interception Return Touchdown
;; 39 : Fumble Return Touchdown
;; 52 : Punt
;; 53 : Kickoff
;; 59 : Field Goal Good
;; 60 : Field Goal Missed
;; 65 : End of Half
;; 66 : End of Game
;; 67 : Passing Touchdown
;; 68 : Rushing Touchdown
;; 74 : Official Timeout
;; 75 : Two-minute warning
;; 79 : End of Regulation
;; 80 : Sack Opp Fumble Recovery

;; End Period
(define nfldb-pt-end-period                         2)
;; Pass Incompletion
(define nfldb-pt-pass-incompletion                  3)
;; Rush
(define nfldb-pt-rush                               5)
;; Sack
(define nfldb-pt-sack                               7)
;; Penalty
(define nfldb-pt-penalty                            8)
;; Fumble Recovery (Own)
(define nfldb-pt-fumble-recovery-own                9)
;; Blocked Punt
(define nfldb-pt-blocked-punt                      17)
;; Blocked Field Goal
(define nfldb-pt-blocked-field-goal                18)
;; Timeout
(define nfldb-pt-timeout                           21)
;; Pass Reception
(define nfldb-pt-pass-reception                    24)
;; Pass Interception Return
(define nfldb-pt-pass-interception-return          26)
;; Fumble Recovery (Opponent)
(define nfldb-pt-fumble-recovery-opponent          29)
;; Muffed Punt Recovery (Opponent)
(define nfldb-pt-muffed-punt-recovery-opponent     30)
;; Kickoff Return Touchdown
(define nfldb-pt-kickoff-return-touchdown          32)
;; Punt Return Touchdown
(define nfldb-pt-punt-return-touchdown             34)
;; Interception Return Touchdown
(define nfldb-pt-interception-return-touchdown     36)
;; Fumble Return Touchdown
(define nfldb-pt-fumble-return-touchdown           39)
;; Punt
(define nfldb-pt-punt                              52)
;; Kickoff
(define nfldb-pt-kickoff                           53)
;; Field Goal Good
(define nfldb-pt-field-goal-good                   59)
;; Field Goal Missed
(define nfldb-pt-field-goal-missed                 60)
;; End of Half
(define nfldb-pt-end-of-half                       65)
;; End of Game
(define nfldb-pt-end-of-game                       66)
;; Passing Touchdown
(define nfldb-pt-passing-touchdown                 67)
;; Rushing Touchdown
(define nfldb-pt-rushing-touchdown                 68)
;; Official Timeout
(define nfldb-pt-official-timeout                  74)
;; Two-minute warning
(define nfldb-pt-twominute-warning                 75)
;; End of Regulation
(define nfldb-pt-end-of-regulation                 79)
;; Sack Opp Fumble Recovery
(define nfldb-pt-sack-opp-fumble-recovery          80)

