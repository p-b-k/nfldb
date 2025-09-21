;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Start playing around with Cairo
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-modules (oop goops))
(use-modules (cairo))

; (use-modules (srfi srfi-19))

(use-modules (g-golf))

(use-modules (bad-cat utils))

(use-modules (bad-cat nfldb game))
(use-modules (bad-cat nfldb team))

(use-modules (bad-cat nfldb ui init))

(define (show-game-diagram-window app component-proc game result)
  (let ( (window (make-instance <gtk-application-window>
                                      #:title (format #f "Overview: ~a" (game.name game))
                                      #:icon "/bad-cat/nfldb/NFL"
                                      #:application app)) )

    (gtk-style-context-add-provider-for-display (gdk-display-get-default) nfldb-css-provider 0)

    (set-child window (component-proc game result))

    (present window)))

;; *********************************************************************************************************************
;; Main entry point to start UI
;; *********************************************************************************************************************

(define (nfldb-show-drives game result)
  (define (proc app) (show-game-diagram-window app get-drives-diagram game result))
  (if (not (is-a? game <nfl-game>)) (throw 'invalid-type 'game (class-name <nfl-game>) (class-name (class-of game))))
  (if (not (is-a? result <nfl-game-result>))
  (throw 'invalid-type 'result (class-name <nfl-game-result>) (class-name (class-of result))))
  (let ( (app (make <gtk-application> #:application-id "bad-cat.nfldb.game-digram")) )
    (connect app 'activate proc)
    (g-application-run app '())))

(define (nfldb-show-plays game result)
  (define (proc app) (show-game-diagram-window app get-plays-diagram game result))
  (if (not (is-a? game <nfl-game>)) (throw 'invalid-type 'game (class-name <nfl-game>) (class-name (class-of game))))
  (if (not (is-a? result <nfl-game-result>))
  (throw 'invalid-type 'result (class-name <nfl-game-result>) (class-name (class-of result))))
  (let ( (app (make <gtk-application> #:application-id "bad-cat.nfldb.game-digram")) )
    (connect app 'activate proc)
    (g-application-run app '())))

(define (nfldb-show-drives-for-team-in-week team-nick week)
  (define (find-game-with-team games)
    (if (null? games)
      #f
      (let ( (next-game (car games)) )
        (if (member team-nick (list (game.home next-game) (game.away next-game)))
          next-game
          (find-game-with-team (cdr games))))))
  (let ( (game (find-game-with-team (get-games (current-season) week))) )
    (if game
      (let ( (result (game.result game)) )
        (if result
          (nfldb-show-drives game result)
          (format #t "The result of game ~a has not been recored yet~%" (game.name game))))
      (format #t "It does not appear that ~a has any games in week ~a~%" team-nick week))))

(define (nfldb-show-plays-for-team-in-week team-nick week)
  (define (find-game-with-team games)
    (if (null? games)
      #f
      (let ( (next-game (car games)) )
        (if (member team-nick (list (game.home next-game) (game.away next-game)))
          next-game
          (find-game-with-team (cdr games))))))
  (let ( (game (find-game-with-team (get-games (current-season) week))) )
    (if game
      (let ( (result (game.result game)) )
        (if result
          (nfldb-show-plays game result)
          (format #t "The result of game ~a has not been recored yet~%" (game.name game))))
      (format #t "It does not appear that ~a has any games in week ~a~%" team-nick week))))

;; *********************************************************************************************************************
;; Proof of Concept
;; *********************************************************************************************************************

;; Layout Parameters
(define margin-left       10)
(define margin-right      10)
(define margin-top        40)
(define margin-bottom     10)
(define yard-width        6)
(define yard-width-5      (* 5 yard-width))
(define ezone-width       (* 2 yard-width-5))
(define pitch-width       (* 20 yard-width-5))
(define ezone-line-width  8)
(define ezone-line-off    (/ ezone-line-width 2))

(define drive-height      40)
(define drive-bar-width   4)
(define drive-bar-stroke  2)

(define play-height       10)
(define play-bar-width    2)
(define play-bar-stroke   1)

(define field-width (+ ezone-width pitch-width ezone-width))

(define (drive-field-height drive-count) (* drive-count drive-height))
(define (play-field-height play-count) (* play-count play-height))

(define total-width (+ margin-left field-width margin-right))

(define (total-drive-height drive-count)
  (+ margin-top (drive-field-height drive-count) margin-bottom))

(define (total-play-height play-count)
  (+ margin-top (play-field-height play-count) margin-bottom))

(define (get-drives-diagram game result)
  (let ( (drawing-area (make-instance <gtk-drawing-area>
                                      #:content-height (total-drive-height (length (result.drives result)))
                                      #:content-width total-width)) )
    (let ( (game-draw-func (make-drives-draw-func game result)) )
      (format #t "game-draw-func = ~a~%" game-draw-func)
      (gtk-drawing-area-set-draw-func drawing-area game-draw-func #f #f)
      drawing-area)))

(define (make-drives-draw-func game result)
  (lambda (drawing-area cr-ptr width height user-data)
    (format #t "make-drives-draw-func: drawing-area cr-ptr width height user_data = ~a ~a ~a ~a ~a~%"
            drawing-area cr-ptr width height user-data)
    (let ( (cr (cairo-pointer->context cr-ptr))
           (pitch-height (drive-field-height (length (result.drives result)))) )
      (draw-base-rectangle cr pitch-height)
      (draw-endzones cr (game.away game) (game.home game) pitch-height)
      (draw-gridlines cr pitch-height)
      (draw-drives cr (game.away game) (game.home game) result))))

(define (get-plays-diagram game result)
  (let ( (drawing-area (make-instance <gtk-drawing-area>
                                      #:content-height (total-play-height (length (result-plays result)))
                                      #:content-width total-width)) )
    (let ( (game-draw-func (make-plays-draw-func game result)) )
      (format #t "game-draw-func = ~a~%" game-draw-func)
      (gtk-drawing-area-set-draw-func drawing-area game-draw-func #f #f)
      drawing-area)))

(define (make-plays-draw-func game result)
  (lambda (drawing-area cr-ptr width height user-data)
    (format #t "make-drives-draw-func: drawing-area cr-ptr width height user_data = ~a ~a ~a ~a ~a~%"
            drawing-area cr-ptr width height user-data)
    (let ( (cr (cairo-pointer->context cr-ptr))
           (pitch-height (play-field-height (length (result-plays result)))) )
      (draw-base-rectangle cr pitch-height)
      (draw-endzones cr (game.away game) (game.home game) pitch-height)
      (draw-gridlines cr pitch-height)
      (draw-plays cr (game.away game) (game.home game) result))))

(define (draw-base-rectangle cr height)
  (cairo-set-line-width cr 0.1)
  (cairo-set-source-rgb cr 0 0.4 0)
  (cairo-rectangle cr margin-left margin-top field-width height)
  (cairo-fill cr))

(define (draw-endzones cr away-nick home-nick height)
  (cairo-set-line-width cr ezone-line-width)
  (let ( (start-x (+ margin-left ezone-width pitch-width))
         (away (get-team away-nick))
         (home (get-team home-nick)) )
    (let ( (x (+ margin-left ezone-line-off))
           (y (+ margin-top ezone-line-off))
           (adj-width (- ezone-width ezone-line-width))
           (adj-height (- height ezone-line-width)) )
      (cairo-rectangle cr x y adj-width adj-height))
    (apply cairo-set-source-rgb (cons cr (rgb->list (team.color away))))
    (cairo-fill-preserve cr)
    (apply cairo-set-source-rgb (cons cr (rgb->list (team.alt-color away))))
    (cairo-stroke cr)

    (let ( (x (+ start-x ezone-line-off))
           (y (+ margin-top ezone-line-off))
           (adj-width (- ezone-width ezone-line-width))
           (adj-height (- height ezone-line-width)) )
      (cairo-rectangle cr x y adj-width adj-height))
    (apply cairo-set-source-rgb (cons cr (rgb->list (team.color home))))
    (cairo-fill-preserve cr)
    (apply cairo-set-source-rgb (cons cr (rgb->list (team.alt-color home))))
    (cairo-stroke cr)))

(define (draw-gridlines cr height)
  (define (width-for-yard yard)
    (case yard
      ( (10) 2.0 )
      ( (4 16) 1.5 )
      ( else (if (even? yard) 0.75 0.25) )))
  (let ( (left-edge (+ margin-left ezone-width)) )
    (define (draw-next-line offset)
      (if (< offset 20)
        (let ( (x (+ left-edge (* offset yard-width-5)))
               (width (width-for-yard offset)) )
          (cairo-set-line-width cr width)
          (cairo-move-to cr x margin-top)
          (cairo-line-to cr x (+ margin-top height))
          (cairo-stroke cr)
          (draw-next-line (1+ offset)))))
    (cairo-set-source-rgb cr 1 1 1)
    (draw-next-line 1)))

(define (draw-drives cr away-nick home-nick result)
  (define (set-color color-list) (apply cairo-set-source-rgb (cons cr color-list)))
  (let ( (home (get-team home-nick))
         (away (get-team away-nick)) )
      (let ( (color-away      (rgb->list (team.color away)))
             (color-away-alt  (rgb->list (team.alt-color away)))
             (color-home      (rgb->list (team.color home)))
             (color-home-alt  (rgb->list (team.alt-color home))) )
        (define (draw-next-drive drive-no todo)
          (if (not (null? todo))
            (let ( (drive (car todo)) )
              (let ( (y (+ margin-top (/ drive-height 2) (* drive-height drive-no)))
                     (start (+ margin-left
                               drive-bar-stroke
                               ezone-width
                               (* yard-width (min (- 100 (slot-ref drive 'start-position))
                                                  (- 100 (slot-ref drive 'end-position))))))
                     (width (- (* yard-width (abs (- (slot-ref drive 'end-position)
                                                     (slot-ref drive 'start-position))))
                               (* 2 drive-bar-stroke))) )
                (cairo-rectangle cr start (- y drive-bar-width) width (* 2 drive-bar-width))
                (set-color  (if (eq? (slot-ref drive 'team-id) (team.id home)) color-home color-away))
                (cairo-fill-preserve cr)
                (set-color  (if (eq? (slot-ref drive 'team-id) (team.id home)) color-home-alt color-away-alt))
                (cairo-stroke cr))
              (draw-next-drive (1+ drive-no) (cdr todo)))))
        (cairo-set-line-width cr drive-bar-stroke)
        (draw-next-drive 0 (result.drives result)))))

(define (draw-plays cr away-nick home-nick result)
  (define (set-color color-list) (apply cairo-set-source-rgb (cons cr color-list)))
  (let ( (home (get-team home-nick))
         (away (get-team away-nick)) )
      (let ( (color-away      (rgb->list (team.color away)))
             (color-away-alt  (rgb->list (team.alt-color away)))
             (color-home      (rgb->list (team.color home)))
             (color-home-alt  (rgb->list (team.alt-color home))) )
        (define (draw-next-play drive-no todo)
          (if (not (null? todo))
            (let ( (play (car todo)) )
              (let ( (y (+ margin-top (/ drive-height 2) (* play-height drive-no)))
                     (start (+ margin-left
                               play-bar-stroke
                               ezone-width
                               (* yard-width (min (- 100 (slot-ref play 'start-position))
                                                  (- 100 (slot-ref play 'end-position))))))
                     (width (- (* yard-width (abs (- (slot-ref play 'end-position)
                                                     (slot-ref play 'start-position))))
                               (* 2 play-bar-stroke))) )
                (cairo-rectangle cr start (- y play-bar-width) width (* 2 play-bar-width))
                (set-color  (if (eq? (slot-ref play 'team-id) (team.id home)) color-home color-away))
                (cairo-fill-preserve cr)
                (set-color  (if (eq? (slot-ref play 'team-id) (team.id home)) color-home-alt color-away-alt))
                (cairo-stroke cr))
              (draw-next-play (1+ drive-no) (cdr todo)))))
        (cairo-set-line-width cr play-bar-stroke)
        (draw-next-play 0 (result-plays result)))))

;; =====================================================================================================================
;; Setup session data
;; =====================================================================================================================

(define this-game (list-ref (get-games 2025 1) 0))
(define this-result (game.result this-game))

