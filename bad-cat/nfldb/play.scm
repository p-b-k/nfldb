(define-module (bad-cat nfldb play)

  ;; *******************************************************************************************************************
  ;; Play related data
  ;; *******************************************************************************************************************
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
(define nfldb-play-type-end-period                          2)
;; Pass Incompletion
(define nfldb-play-type-pass-incompletion                   3)
;; Rush
(define nfldb-play-type-rush                                5)
;; Sack
(define nfldb-play-type-sack                                7)
;; Penalty
(define nfldb-play-type-penalty                             8)
;; Fumble Recovery (Own)
(define nfldb-play-type-fumble-recovery-own                 9)
;; Blocked Punt
(define nfldb-play-type-blocked-punt                       17)
;; Blocked Field Goal
(define nfldb-play-type-blocked-field-goal                 18)
;; Timeout
(define nfldb-play-type-timeout                            21)
;; Pass Reception
(define nfldb-play-type-pass-reception                     24)
;; Pass Interception Return
(define nfldb-play-type-pass-interception-return           26)
;; Fumble Recovery (Opponent)
(define nfldb-play-type-fumble-recovery-opponent           29)
;; Muffed Punt Recovery (Opponent)
(define nfldb-play-type-muffed-punt-recovery-opponent      30)
;; Kickoff Return Touchdown
(define nfldb-play-type-kickoff-return-touchdown           32)
;; Punt Return Touchdown
(define nfldb-play-type-punt-return-touchdown              34)
;; Interception Return Touchdown
(define nfldb-play-type-interception-return-touchdown      36)
;; Fumble Return Touchdown
(define nfldb-play-type-fumble-return-touchdown            39)
;; Punt
(define nfldb-play-type-punt                               52)
;; Kickoff
(define nfldb-play-type-kickoff                            53)
;; Field Goal Good
(define nfldb-play-type-field-goal-good                    59)
;; Field Goal Missed
(define nfldb-play-type-field-goal-missed                  60)
;; End of Half
(define nfldb-play-type-end-of-half                        65)
;; End of Game
(define nfldb-play-type-end-of-game                        66)
;; Passing Touchdown
(define nfldb-play-type-passing-touchdown                  67)
;; Rushing Touchdown
(define nfldb-play-type-rushing-touchdown                  68)
;; Official Timeout
(define nfldb-play-type-official-timeout                   74)
;; Two-minute warning
(define nfldb-play-type-twominute-warning                  75)
;; End of Regulation
(define nfldb-play-type-end-of-regulation                  79)
;; Sack Opp Fumble Recovery
(define nfldb-play-type-sack-opp-fumble-recovery           80)

