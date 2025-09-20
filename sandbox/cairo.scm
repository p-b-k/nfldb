;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Start playing around with Cairo
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-modules (oop goops))
(use-modules (cairo))

; (use-modules (srfi srfi-19))

(use-modules (g-golf))

(use-modules (bad-cat nfldb ui init))

(use-modules (bad-cat utils))

(use-modules (bad-cat nfldb game))
(use-modules (bad-cat nfldb team))

(define (show-game-diagram-window app game result)
  (let ( (window (make-instance <gtk-application-window>
                                      #:title (format #f "Overview: ~a" (game.name game))
                                      #:icon "/bad-cat/nfldb/NFL"
                                      #:application app)) )
    (set-child window (get-game-diagram game result))

    (present window)))

;; *********************************************************************************************************************
;; Main entry point to start UI
;; *********************************************************************************************************************

(define (nfldb-show-game-diagram game result)
  (define (proc app) (show-game-diagram-window app game result))
  (if (not (is-a? game <nfl-game>)) (throw 'invalid-type 'game (class-name <nfl-game>) (class-name (class-of game))))
  (if (not (is-a? result <nfl-game-result>))
  (throw 'invalid-type 'result (class-name <nfl-game-result>) (class-name (class-of result))))
  (let ( (app (make <gtk-application> #:application-id "bad-cat.nfldb.game-digram")) )
    (connect app 'activate proc)
    (g-application-run app '())))

;; DEFINE PARAMETERS
(define margin-left   10)
(define margin-right  10)
(define margin-top    10)
(define margin-bottom 10)
(define drive-height  10)
(define yard-width-5  20)

(define total-width (+ margin-left
                       (* 2 yard-width-5)
                       (* 20 yard-width-5)
                       (* 2 yard-width-5)
                       margin-right))

(define (total-height drive-count)
  (+ margin-top
     (* drive-count drive-height)
     margin-bottom))

(define (get-game-diagram game result)
  (let ( (drawing-area (make-instance <gtk-drawing-area>
                                      #:content-height (total-height (length (result.drives result)))
                                      #:content-width total-width)) )
    (let ( (game-draw-func (make-game-draw-func game result)) )
      (format #t "game-draw-func = ~a~%" game-draw-func)
      (gtk-drawing-area-set-draw-func drawing-area game-draw-func #f #f)
      drawing-area)))

(define (make-game-draw-func game result)
  (lambda (drawing-area cr-ptr width height user-data)
    (format #t "make-game-draw-func: drawing-area cr-ptr width height user_data = ~a ~a ~a ~a ~a~%"
            drawing-area cr-ptr width height user-data)
    (let ( (cr (cairo-pointer->context cr-ptr)) )
      (draw-base-rectangle cr game result)
      
      (cairo-paint cr))))

(define (draw-base-rectangle cr game result)
  (format #t "make-game-draw-func: cr = ~a~%" cr)
  (cairo-set-line-width cr 0.1)
  (cairo-set-source-rgb cr 0 0.4 0)
  (cairo-rectangle cr 0.25 0.25 0.3 0.3)
  (cairo-stroke cr))

(define this-game (car (get-games 2025 1)))
(define this-result (game.result this-game))
