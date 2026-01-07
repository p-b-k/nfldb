(define-module (bad-cat nfldb ui panels preview)

  ;; *******************************************************************************************************************
  ;; Main Panel with home team info on top and general upcoming games of interest bellow
  ;; *******************************************************************************************************************

  #:use-module (oop goops)
  #:use-module (g-golf)

  #:use-module (bad-cat utils)

  #:use-module (bad-cat nfldb)
  #:use-module (bad-cat nfldb team)
  #:use-module (bad-cat nfldb game)
  #:use-module (bad-cat nfldb schedule)

  #:use-module (bad-cat nfldb cache standings)
  #:use-module (bad-cat nfldb cache result)
  #:use-module (bad-cat nfldb cache schedule)
  #:use-module (bad-cat nfldb cache league)

  ; #:use-module (bad-cat nfldb ui panels divpanel)
  ; #:use-module (bad-cat nfldb ui panels schedulebar)
  #:use-module (bad-cat nfldb ui controls preview-cairo)

  #:export (get-preview-layout)
  #:export (preview-height)
  #:export (preview-width)

  #:export (box-height)
  #:export (team-space)
  #:export (div-space)
  #:export (box-width)
  #:export (graph-width)
  #:export (h-margin)
  #:export (v-margin)
  #:export (info-height)
  #:export (info-margin)
)

(define box-height        (make-parameter 32))
(define team-space        (make-parameter 2))
(define div-space         (make-parameter 16))
(define box-width         (make-parameter 88))
(define graph-width       (make-parameter 600))
(define h-margin          (make-parameter 30))
(define v-margin          (make-parameter 30))
(define info-height       (make-parameter 200))
(define info-margin       (make-parameter 8))

(define (conf-width)  (+ (box-width) (* 2 (box-height))))
(define (info-width)  (+ (graph-width) (* 2 (conf-width))))
(define (conf-height) (+ (* 16 (box-height))
                         (* 12 (team-space))
                         (* 3  (div-space))))
(define (div-height)  (+ (* 4  (box-height))
                         (* 3  (team-space))))

(define (preview-height) (+ (* 2 (v-margin)) (conf-height) (info-margin) (info-height)))
(define (preview-width)  (+ (* 2 (h-margin)) (info-width)))

; (format #t "===== HEIGHT DIMS~%")
; (format #t "DIMS: ~20a : ~a~%" 'v-margin (v-margin))
; (format #t "DIMS: ~20a : ~a~%" 'box-height (box-height))
; (format #t "DIMS: ~20a : ~a~%" 'team-space (team-space))
; (format #t "DIMS: ~20a : ~a~%" 'div-height (div-height))
; (format #t "DIMS: ~20a : ~a~%" 'div-space (div-space))
; (format #t "DIMS: ~20a : ~a~%" 'info-height (info-height))
; (format #t "DIMS: ~20a : ~a~%" 'info-margin (info-margin))
; (format #t "DIMS: ~20a : ~a~%" 'conf-height (conf-height))
; (format #t "DIMS: ~20a : ~a~%" 'preview-height (preview-height))
; (format #t "===== WIDTH DIMS~%")
; (format #t "DIMS: ~20a : ~a~%" 'h-margin (h-margin))
; (format #t "DIMS: ~20a : ~a~%" 'box-width (box-width))
; (format #t "DIMS: ~20a : ~a~%" 'graph-width (graph-width))
; (format #t "DIMS: ~20a : ~a~%" 'conf-width (conf-width))
; (format #t "DIMS: ~20a : ~a~%" 'info-width (info-width))
; (format #t "DIMS: ~20a : ~a~%" 'preview-width (preview-width))

(define-method (get-preview-layout (year <integer>) (week <integer>))
  (let ( (info-panel (get-week-info-panel year week))
         (graph-panel (get-game-graph-panel year week)) )
    (let ( (root-fixed (make-instance <gtk-fixed>)) )
      (gtk-widget-set-size-request root-fixed (preview-width) (preview-height))
      (add-conference root-fixed year week 'AFC)
      (add-conference root-fixed year week 'NFC)

      ;; Set the panel sizes
      (gtk-widget-set-size-request info-panel (info-width) (info-height))
      (gtk-widget-set-size-request graph-panel (graph-width) (conf-height))

      ; (slot-set! info-panel 'css-classes '("test-c"))

      ;; Set them to the root
      (gtk-fixed-put root-fixed info-panel (h-margin) (+ (conf-height) (info-margin) (v-margin)))
      (gtk-fixed-put root-fixed graph-panel (+ (conf-width) (h-margin)) (v-margin))

      root-fixed)))

(define (get-game-status year week team)
  (let ( (game (get-team-game-for-week team year week)) )
    (if game
        (let ( (result (game.result game)) )
          (if result
            (if (game-tied? result)
              "tie"
              (if (game-winner? game result team)
                "win"
                "lose"))
            "not-played"))
        "bye")))

(define left-align )

(define gtk-align-fill            0)
(define gtk-align-start           1)
(define gtk-align-end             2)
(define gtk-align-center          3)
(define gtk-align-baseline-fill   4)
(define gtk-align-baseline        5)
(define gtk-align-baseline-center 6)

(define (get-team-panel is-afc? year-no week-no team-standing-pair)
  (define (get-game-status-resource)
    (let ( (box (make-instance <gtk-box>))
           (image (gtk-image-new-from-resource
                  (format #f "/bad-cat/nfldb/~a" (get-game-status year-no week-no (car team-standing-pair))))) )
      (gtk-widget-set-size-request image (floor (/ (* 2 (box-height)) 3)) (floor (/ (* 2 (box-height)) 3)))
      (gtk-widget-set-size-request box (box-height) (box-height))

      (gtk-box-append box image)
      box))

  (define (get-team-image)
    (let ( (image-path  (format #f "/bad-cat/nfldb/~a/logo" (car team-standing-pair))) )
      (let ( (image (gtk-image-new-from-resource image-path))
             (box (make-instance <gtk-box>))
             (team-css (format #f "team_~a" (car team-standing-pair))) )
        (gtk-widget-set-size-request image (box-height) (box-height))

        (slot-set! box 'css-classes (list team-css))

        (gtk-box-append box image)
        box)))

  (define (get-team-win-loss-tie-record team)
    (format #t "get-team-win-loss-tie-record: called on ~a~%" team)
    (let ( (team-id (team.nick team)) )
      (format #t "get-team-win-loss-tie-record: team-id = ~a~%" team-id)
      (let ( (record (get-team-record team-id)) )
        (format #t "get-team-win-loss-tie-record: record for ~a is ~a~%" team-id record)
        (format #f "~2,' d - ~2,' d - ~1,' d"
                (car (slot-ref record 'w)) (car (slot-ref record 'l)) (car (slot-ref record 't))))))

  (let ( (panel      (make-instance <gtk-box> #:orientation 'horizontal #:homogenous #f))
         (cbox       (make-instance <gtk-center-box>))
         (team       (get-team (car team-standing-pair)))
         (standings  (cdr team-standing-pair)) )
    (let ( (wltr-label  (make-instance <gtk-label> #:label (get-team-win-loss-tie-record team)))
           (game-status (get-game-status-resource))
           (team-logo   (get-team-image))
           (name-label  (make-instance <gtk-label> #:label (format #f "~a" (team.name team)))) )
      
      (slot-set! cbox 'halign gtk-align-fill)
      (if is-afc?
          (begin
            (gtk-center-box-set-end-widget cbox panel)

            (gtk-box-append panel wltr-label)
            (gtk-box-append panel game-status)
            (gtk-box-append panel team-logo)

            (slot-set! wltr-label  'halign gtk-align-fill)
            (slot-set! game-status 'halign gtk-align-start)
            (slot-set! team-logo   'halign gtk-align-start)

            (slot-set! wltr-label 'css-classes '("afc-preview-team")))
          (begin
            (gtk-center-box-set-start-widget cbox panel)

            (gtk-box-append panel team-logo)
            (gtk-box-append panel game-status)
            (gtk-box-append panel wltr-label)

            (slot-set! wltr-label  'halign gtk-align-fill)
            (slot-set! game-status 'halign gtk-align-end)
            (slot-set! team-logo   'halign gtk-align-end)

            (slot-set! wltr-label 'css-classes '("nfc-preview-team"))))

      (gtk-widget-set-size-request panel (+ (box-width) (* 2 (box-height))) (box-height))

      cbox)))

(define (add-conference panel year-no week-no conf)
  (define (get-div-teams div)
    (map get-team (map car (get-standings conf div))))
  (let ( (afc?  (eq? conf 'AFC)) )
    (let ( (left-edge (if afc? (h-margin) (+ (h-margin) (conf-width) (graph-width)))) )
      (define (add-divs div-no list-of-divs)
        (define (add-teams team-no list-of-teams)
          (if (not (null? list-of-teams))
              (let ( (next (car list-of-teams)) )
                (let ( (team-panel (get-team-panel afc? year-no week-no next))
                       (top-edge (+ (v-margin)
                                    (* div-no  (+ (div-height) (div-space)))
                                    (* team-no (+ (box-height) (team-space))))) )
                  (if afc? (format #t "adding at x = ~3d, y = ~3d : ~a~%" left-edge top-edge (car next)))
                  (gtk-fixed-put panel team-panel left-edge top-edge))
                (add-teams (1+ team-no) (cdr list-of-teams)))))
        (if (not (null? list-of-divs))
            (let ( (next (car list-of-divs)) )
              (add-teams 0 next)
              (add-divs (1+ div-no) (cdr list-of-divs)))))
      (let ( (conf (map (lambda (d) (get-standings conf d)) '(EAST NORTH SOUTH WEST))) )
        (add-divs 0 conf))))
  panel)  

(define (get-week-info-panel year week)
  (make-instance <gtk-label> #:label "Week Info Panel"))

(define (get-game-graph-panel year week)
  (make-week-preview-control year week (graph-width) (conf-height) (box-height) (team-space) (div-space)))

