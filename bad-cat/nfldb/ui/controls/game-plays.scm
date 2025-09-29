(define-module (bad-cat nfldb ui controls game-plays)

  ;; *******************************************************************************************************************
  ;; Define the function for drawing the game's plays
  ;; *******************************************************************************************************************

  #:use-module (oop goops)
  #:use-module (cairo)

  #:use-module (bad-cat utils)

  #:use-module (bad-cat nfldb play)
  #:use-module (bad-cat nfldb game)
  #:use-module (bad-cat nfldb ui parameters)

  #:use-module (bad-cat nfldb cache league)
  #:use-module (bad-cat nfldb team)

  #:export (make-game-play-draw-func)
  #:export (play-type->renderer)
  #:export (play-renderer-height)
  #:export (play-renderer-draw)
)

(define-class <result-layout> ()
  (offset-hash  #:init-form       (make-hash-table)
                #:getter          rl.offsets)
  (total-height #:init-form       (make-hash-table)
                #:getter          rl.height
                #:setter          rl.height!)
)

(define (make-result-layout result)
  (let ( (layout (make-instance <result-layout>)) )
    (define (proc-plays sofar plays)
      (if (null? plays)
        sofar
        (let ( (play (car plays)) )
          (hash-set! (rl.offsets layout) (slot-ref play 'play-id) sofar)
          (let ( (height (play-renderer-height (play-type->renderer (slot-ref play 'type-id)))) )
            (proc-plays (+ sofar height) (cdr plays))))))
    (let ( (total-height (proc-plays 0 (result-plays result))) )
      (rl.height! layout total-height)
      layout)))

(define (make-game-play-draw-func game result)
  (lambda (drawing-area cr-ptr width height user-data)
    (let ( (cr (cairo-pointer->context cr-ptr))
           (rl (make-result-layout result)) )
      (draw-field cr width height)
      (draw-endzones cr width height game)
      (draw-yard-lines cr width height)
      (format #t "make-game-play-draw-func: game = ~a, result = ~a~%" game result)
      (draw-events cr game result width rl)
      #t)))

(define-class <play-renderer> ())

(define-method (play-renderer-height (p <play-renderer>)) 0)

(define-method (play-renderer-draw (pr <play-renderer>)
                                   cr
                                   (p <nfl-game-play>)
                                   (g <nfl-game>)
                                   (r <nfl-game-result>)
                                   (top <integer>)
                                   (width <integer>))
  (format #t "Undefined renderer for ~a~%" (class-name (class-of pr)))
  (if #f #t))

(define-class <non-play-renderer> (<play-renderer>))
(define-class <timeout-renderer> (<non-play-renderer>))
(define-class <quarter-renderer> (<non-play-renderer>))
(define-class <half-renderer> (<non-play-renderer>))

(define-class <scrimmage-renderer> (<play-renderer>))
(define-class <rush-renderer> (<scrimmage-renderer>))
(define-class <pass-renderer> (<scrimmage-renderer>))
(define-class <fumble-own-renderer> (<scrimmage-renderer>))

(define-class <no-prog-renderer> (<scrimmage-renderer>))
(define-class <incomplete-renderer> (<no-prog-renderer>))

(define-class <loss-renderer> (<scrimmage-renderer>))
(define-class <sack-renderer> (<loss-renderer>))

(define-class <kick-renderer> (<scrimmage-renderer>))
(define-class <blocked-renderer> (<kick-renderer>))

(define-class <turnover-renderer> (<play-renderer>))
(define-class <return-renderer> (<turnover-renderer>))
(define-class <fumble-loss-renderer> (<turnover-renderer>))
(define-class <interception-loss-renderer> (<turnover-renderer>))

(define-class <penalty-renderer> (<play-renderer>))


(define (play-type->renderer type-id)
  (cond
    ;; End Period
    ( (= type-id
         nfldb-pt-end-period)
      (make-instance <quarter-renderer>) )
    ;; Pass Incompletion
    ( (= type-id
         nfldb-pt-pass-incompletion)
      (make-instance <incomplete-renderer>) )
    ;; Rush
    ( (= type-id
         nfldb-pt-rush)
      (make-instance <rush-renderer>) )
    ;; Sack
    ( (= type-id
         nfldb-pt-sack)
      (make-instance <sack-renderer>) )
    ;; Penalty
    ( (= type-id
         nfldb-pt-penalty)
      (make-instance <penalty-renderer>) )
    ; ;; Fumble Recovery (Own)
    ( (= type-id
         nfldb-pt-fumble-recovery-own)
      (make-instance <fumble-own-renderer>) )
    ; ;; Blocked Punt
    ( (= type-id
         nfldb-pt-blocked-punt)
      (make-instance <blocked-renderer>) )
    ; ;; Blocked Field Goal
    ( (= type-id
         nfldb-pt-blocked-field-goal)
      (make-instance <blocked-renderer>) )
    ;; Timeout
    ( (= type-id
         nfldb-pt-timeout)
      (make-instance <timeout-renderer>) )
    ;; Pass Reception
    ( (= type-id
         nfldb-pt-pass-reception)
      (make-instance <pass-renderer>) )
    ;; Pass Interception Return
    ( (= type-id
         nfldb-pt-pass-interception-return)
      (make-instance <interception-loss-renderer>) )
    ;; Fumble Recovery (Opponent)
    ( (= type-id
         nfldb-pt-fumble-recovery-opponent)
      (make-instance <fumble-loss-renderer>) )
    ;; Muffed Punt Recovery (Opponent)
    ( (= type-id
         nfldb-pt-muffed-punt-recovery-opponent)
      (make-instance <turnover-renderer>) )
    ;; Kickoff Return Touchdown
    ( (= type-id
         nfldb-pt-kickoff-return-touchdown)
      (make-instance <return-renderer>) )
    ;; Punt Return Touchdown
    ( (= type-id
         nfldb-pt-punt-return-touchdown)
      (make-instance <return-renderer>) )
    ;; Interception Return Touchdown
    ( (= type-id
         nfldb-pt-interception-return-touchdown)
      (make-instance <interception-loss-renderer>) )
    ;; Fumble Return Touchdown
    ( (= type-id
         nfldb-pt-fumble-return-touchdown)
      (make-instance <fumble-loss-renderer>) )
    ;; Punt
    ( (= type-id
         nfldb-pt-punt)
      (make-instance <return-renderer>) )
    ;; Kickoff
    ( (= type-id
         nfldb-pt-kickoff)
      (make-instance <return-renderer>) )
    ;; Field Goal Good
    ( (= type-id
         nfldb-pt-field-goal-good)
      (make-instance <kick-renderer>) )
    ;; Field Goal Missed
    ( (= type-id
         nfldb-pt-field-goal-missed)
      (make-instance <no-prog-renderer>) )
    ;; End of Half
    ( (= type-id
         nfldb-pt-end-of-half)
      (make-instance <half-renderer>) )
    ;; End of Game
    ( (= type-id
         nfldb-pt-end-of-game)
      (make-instance <non-play-renderer>) )
    ;; Passing Touchdown
    ( (= type-id
         nfldb-pt-passing-touchdown)
      (make-instance <pass-renderer>) )
    ;; Rushing Touchdown
    ( (= type-id
         nfldb-pt-rushing-touchdown)
      (make-instance <rush-renderer>) )
    ;; Official Timeout
    ( (= type-id
         nfldb-pt-official-timeout)
      (make-instance <timeout-renderer>) )
    ;; Two-minute warning
    ( (= type-id
         nfldb-pt-twominute-warning)
      (make-instance <timeout-renderer>) )
    ;; End of Regulation
    ( (= type-id
         nfldb-pt-end-of-regulation)
      (make-instance <half-renderer>) )
    ;; Sack Opp Fumble Recovery
    ( (= type-id
         nfldb-pt-sack-opp-fumble-recovery)
      (make-instance <turnover-renderer>) )
    ( #t
      (format #t "returning ~a because no other match found for id ~a (~a)~%"
              (class-name <play-renderer>) type-id (class-name (class-of type-id)))
      (make-instance <play-renderer>) )))

;; =====================================================================================================================
;; Implement play graph drawing subroutines
;; =====================================================================================================================

(define (draw-field cr width height)
  (define (draw-light yard)
    (if (< yard 10)
      (let ( (offset (+ (endzone-width) (* (yard-width) (* yard 10)) (* (if (< yard 5) 0 5) (yard-width)))) )
        (cairo-rectangle cr offset 0 (* 5 (yard-width)) height)
        (cairo-fill cr)
        (draw-light (1+ yard)))))

  (cairo-set-source-rgb cr 0 0.4 0.1)
  (cairo-rectangle cr 0 0 width height)
  (cairo-fill cr)
  (cairo-set-source-rgb cr 0.0 0.42 0.12)
  (draw-light 0))

(define (draw-endzones cr width height game)
  (let ( (home-team (get-team (game.home game)))
         (away-team (get-team (game.away game))) )
    (cairo-rectangle cr 0 0 (endzone-width) height)
    (apply cairo-set-source-rgb (cons cr (rgb->list (team.color away-team))))
    (cairo-fill-preserve cr)
    (apply cairo-set-source-rgb (cons cr (rgb->list (team.alt-color away-team))))
    (cairo-stroke cr)

    (apply cairo-set-source-rgb (cons cr (rgb->list (team.color home-team))))
    (cairo-rectangle cr (+ (endzone-width) (field-width))  0 (endzone-width) height)
    (cairo-fill-preserve cr)
    (apply cairo-set-source-rgb (cons cr (rgb->list (team.alt-color home-team))))
    (cairo-stroke cr)))

(define (draw-yard-lines cr width height)
  (define (width-for-yard yard)
    (case yard
      ( (10) 2.0 )
      ( (4 16) 1.5 )
      ( else (if (even? yard) 0.75 0.25) )))
  (let ( (left-edge (endzone-width)) )
    (define (draw-next-line offset)
      (if (< offset 20)
        (let ( (x (+ left-edge (* offset (* 5 (yard-width)))))
               (width (width-for-yard offset)) )
          (cairo-set-line-width cr width)
          (cairo-move-to cr x 0)
          (cairo-line-to cr x height)
          (cairo-stroke cr)
          (draw-next-line (1+ offset)))))
    (cairo-set-source-rgb cr 1 1 1)
    (draw-next-line 1)))

(define (draw-events cr game result width rl)
  (define (proc-events top todo)
    (if (not (null? todo))
      (let ( (event (car todo)) )
        (let ( (renderer (play-type->renderer (slot-ref event 'type-id))) )
          (play-renderer-draw renderer cr event game result top width)
          (proc-events (+ (play-renderer-height renderer) top) (cdr todo))))))
  (proc-events 0 (result-plays result)))

;; =====================================================================================================================
;; Start implementing the rendering and sizing functions
;; =====================================================================================================================

(define-method (play-renderer-height (p <scrimmage-renderer>)) (play-bar-total-height))
(define-method (play-renderer-height (p <turnover-renderer>)) 30)
(define-method (play-renderer-height (p <quarter-renderer>)) 10)
(define-method (play-renderer-height (p <half-renderer>)) 15)
(define-method (play-renderer-height (p <timeout-renderer>)) 5)
(define-method (play-renderer-height (p <penalty-renderer>)) 5)

(define-method (draw-progress (pr <scrimmage-renderer>) cr top start-pos end-pos team home?)
  (draw-progress-bar cr top start-pos end-pos team home?))

(define-method (draw-yds-to-first-down (pr <scrimmage-renderer>) cr start-pos yds-to-go top height width)
  (draw-yds-to-go cr start-pos yds-to-go top height width))

(define-method (draw-start-pos (pr <scrimmage-renderer>) cr start-pos main-color alt-color top height width)
  (draw-bulb pr cr start-pos main-color alt-color top height width))

(define-method (play-renderer-draw (pr <scrimmage-renderer>)
                                   cr
                                   (p <nfl-game-play>)
                                   (g <nfl-game>)
                                   (r <nfl-game-result>)
                                   (top <integer>)
                                   (width <integer>))
  (define (get-offense) (get-team (slot-ref p 'team-id)))
  (let ( (height (play-renderer-height pr))
         (start-pos (- 100 (slot-ref p 'start-position)))
         (team (get-offense))
         (end-pos (slot-ref p 'end-position)) )
    (let ( (main-color (team.color team))
           (home?      (eq? (game.home g) (team.nick team)))
           (alt-color  (team.alt-color team)) )
      (let ( (yds-to-go  (* (if home? 1 -1) (slot-ref p 'yds-to-go))) )
        (draw-progress pr cr top start-pos end-pos team home?)
        (draw-yds-to-first-down pr cr start-pos yds-to-go top height width)
        (draw-start-pos pr cr start-pos main-color alt-color top height width))
      )))

(define-method (draw-progress (pr <no-prog-renderer>) cr top start-pos end-pos team home?))
(define-method (draw-start-pos (pr <incomplete-renderer>) cr start-pos main-color alt-color top height width)
  (draw-bulb pr cr start-pos alt-color main-color top height width))


(define-method (play-renderer-draw (pr <penalty-renderer>)
                                   cr
                                   (p <nfl-game-play>)
                                   (g <nfl-game>)
                                   (r <nfl-game-result>)
                                   (top <integer>)
                                   (width <integer>))
  (format #t "play-renderer-draw.~a: start-pos = ~a, end-pos = ~a, yards = ~a~%"
          (class-name (class-of pr)) (slot-ref p 'start-position) (slot-ref p 'end-position) (slot-ref p 'yards)))


(define (draw-regress cr top start end team home?)
  (let ( (x (+ (endzone-width) (* (yard-width) start)))
         (y (+ top (play-bar-margin)))
         (w (- end start))
         (h (+ (* 2 (play-bar-stroke-width)) (play-bar-height))) )
    (cairo-rectangle cr x y w h)
    (apply cairo-set-source-rgb cr (rgb->list (team.alt-color team)))
    (cairo-fill-preserve cr)
    (apply cairo-set-source-rgb cr (rgb->list (team.color team)))
    (cairo-stroke cr)))

(define (draw-progress-bar cr top start end team home?)
  (let ( (x (+ (endzone-width) (* (yard-width) start)))
         (y (+ top (play-bar-margin)))
         (w (- end start))
         (h (+ (* 2 (play-bar-stroke-width)) (play-bar-height))) )
    (cairo-rectangle cr x y w h)
    (apply cairo-set-source-rgb cr (rgb->list (team.color team)))
    (cairo-fill-preserve cr)
    (apply cairo-set-source-rgb cr (rgb->list (team.alt-color team)))
    (cairo-stroke cr)))

(define (draw-yds-to-go cr start-pos yds-to-go top height width)
  (cairo-set-line-width cr (yds-to-go-stroke-width))
  (cairo-set-source-rgba cr 1 1 0 0.85)
  (cairo-move-to cr (+ (endzone-width) (* (yard-width) start-pos)) (+ top (/ height 2)))
  (cairo-line-to cr (+ (endzone-width) (* (yard-width) (+ start-pos yds-to-go))) (+ top (/ height 2)))
  (cairo-stroke cr))

(define (draw-bulb pr cr start-pos main-color alt-color top height width)
  (cairo-set-line-width cr (play-bar-stroke-width))
  (let ( (x (+ (endzone-width) (* (yard-width) start-pos)))
         (y (+ top (/ height 2))) )
    (cairo-arc cr x y (play-bar-bulb) 0.0 (* 2 (hacky-pi))))
  (cairo-close-path cr)
  (apply cairo-set-source-rgb cr (rgb->list main-color))
  (cairo-fill-preserve cr)
  (apply cairo-set-source-rgb cr (rgb->list alt-color))
  (cairo-stroke cr))

(define-method (non-play-set-color (p <non-play-renderer>) cr)
  (cairo-set-source-rgba cr 0.3 0.3 0.3 0.73))
  
(define-method (non-play-set-color (p <timeout-renderer>) cr)
  (cairo-set-source-rgba cr 0.3 0.53 0.43 0.73))

(define-method (play-renderer-draw (pr <non-play-renderer>)
                                   cr
                                   (p <nfl-game-play>)
                                   (g <nfl-game>)
                                   (r <nfl-game-result>)
                                   (top <integer>)
                                   (width <integer>))
  (non-play-set-color pr cr)
  (cairo-rectangle cr (endzone-width) top (- width (* 2 (endzone-width))) (play-renderer-height pr))
  (cairo-fill cr))

