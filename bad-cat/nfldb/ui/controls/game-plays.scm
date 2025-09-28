(define-module (bad-cat nfldb ui controls game-plays)

  ;; *******************************************************************************************************************
  ;; Define the function for drawing the game's plays
  ;; *******************************************************************************************************************

  #:use-module (oop goops)
  #:use-module (cairo)

  #:use-module (bad-cat nfldb play)
  #:use-module (bad-cat nfldb game)
  #:use-module (bad-cat nfldb ui parameters)

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
  (format #t "make-game-play-draw-func: calling on ~a ~a~%" game result)
  (lambda (drawing-area cr-ptr width height user-data)
    (let ( (cr (cairo-pointer->context cr-ptr))
           (rl (make-result-layout result)) )
      (draw-field cr width height)
      (draw-endzones cr width height)
      (draw-lines cr width height)
      (draw-breaks cr width rl)
      (draw-timeouts cr width rl)
      (draw-plays cr width rl)
      #t)))

(define-class <play-renderer> ())

(define-method (play-renderer-height (p <play-renderer>))
; (format #t "play-renderer-height: calling on ~a~%" (class-name (class-of p)))
  0)

(define-method (play-renderer-draw (pr <play-renderer>)
                                   cr
                                   (p <nfl-game-play>)
                                   (g <nfl-game>)
                                   (r <nfl-game-result>)
                                   (top <integer>)
                                   (width <integer>)
                                   (height <integer>)))

(define-class <non-play-renderer> (<play-renderer>))
(define-class <timeout-renderer> (<non-play-renderer>))
(define-class <break-renderer> (<non-play-renderer>))

(define-class <normal-renderer> (<play-renderer>))
(define-class <rush-renderer> (<normal-renderer>))
(define-class <pass-renderer> (<normal-renderer>))

(define-class <back-renderer> (<normal-renderer>))
(define-class <sack-renderer> (<back-renderer>))

(define-class <kick-renderer> (<normal-renderer>))
(define-class <blocked-renderer> (<kick-renderer>))

(define-class <turnover-renderer> (<play-renderer>))
(define-class <return-renderer> (<turnover-renderer>))

(define-class <no-prog-renderer> (<play-renderer>))

(define (play-type->renderer type-id)
  (cond
    ;; End Period
    ( (= type-id
         nfldb-pt-end-period)
      (make-instance <break-renderer>) )
    ;; Pass Incompletion
    ( (= type-id
         nfldb-pt-pass-incompletion)
      (make-instance <no-prog-renderer>) )
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
      (make-instance <no-prog-renderer>) )
    ; ;; Fumble Recovery (Own)
    ( (= type-id
         nfldb-pt-fumble-recovery-own)
      (make-instance <normal-renderer>) )
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
      (make-instance <turnover-renderer>) )
    ;; Fumble Recovery (Opponent)
    ( (= type-id
         nfldb-pt-fumble-recovery-opponent)
      (make-instance <turnover-renderer>) )
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
      (make-instance <turnover-renderer>) )
    ;; Fumble Return Touchdown
    ( (= type-id
         nfldb-pt-fumble-return-touchdown)
      (make-instance <turnover-renderer>) )
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
      (make-instance <break-renderer>) )
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
      (make-instance <break-renderer>) )
    ;; Sack Opp Fumble Recovery
    ( (= type-id
         nfldb-pt-sack-opp-fumble-recovery)
      (make-instance <turnover-renderer>) )
    ( #t
      (format #t "returning ~a because no other match found for id ~a (~a)~%"
              (class-name <play-renderer>) type-id (class-name (class-of type-id)))
      (make-instance <play-renderer>) )))

;; =====================================================================================================================
;; Start implementing the rendering and sizing functions
;; =====================================================================================================================

(define-method (play-renderer-height (p <normal-renderer>)) 20)
(define-method (play-renderer-height (p <turnover-renderer>)) 30)



(define (draw-field cr width height)
  (define (draw-light yard)
    (format #t "draw-light: drawing light at ~a~%" yard)
    (if (< yard 10)
      (let ( (offset (+ (endzone-width) (* (yard-width) (* yard 10)) (* (if (< yard 5) 0 5) (yard-width)))) )
        (format #t "draw-light: about to draw rectangle NW = ~a ~a, WH = ~a ~a~%" offset 0 (* 5 (yard-width)) height)
        (cairo-rectangle cr offset 0 (* 5 (yard-width)) height)
        (cairo-fill cr)
        (draw-light (1+ yard)))))

  (cairo-set-source-rgb cr 0 0.4 0.1)
  (cairo-rectangle cr 0 0 width height)
  (cairo-fill cr)
  (cairo-set-source-rgb cr 0.0 0.42 0.12)
  (draw-light 0))
  

(define (draw-endzones cr width height)
  (cairo-set-source-rgb cr 0 0 0)
  (cairo-rectangle cr 0 0 (endzone-width) height)
  (cairo-fill-preserve cr)
  (cairo-set-source-rgb cr 1 1 1)
  (cairo-stroke cr)

  (cairo-set-source-rgb cr 0 0 0)
  (cairo-rectangle cr (+ (endzone-width) (field-width))  0 (endzone-width) height)
  (cairo-fill-preserve cr)
  (cairo-set-source-rgb cr 1 1 1)
  (cairo-stroke cr))

(define (draw-lines cr width height)
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

(define (draw-breaks cr width rl) #f)

(define (draw-timeouts cr width rl) #f)

(define (draw-plays cr width rl) #f)

