(define-module (bad-cat nfldb ui panels divpanel)

  ;; *******************************************************************************************************************
  ;; A Division Panel listing the standings
  ;; *******************************************************************************************************************

  #:use-module (oop goops)
  #:use-module (g-golf)

  #:use-module (bad-cat utils)

  #:use-module (bad-cat nfldb cache standings)

  #:export (get-div-panel)
)

(define (get-div-panel conf div)
  (let ( (root-vbox (make-instance <gtk-box> #:orientation 'vertical #:homogenous #f)) 
         (div-label (make-instance <gtk-label> #:label (format #f "~a ~a" conf div))) )
    (slot-set! div-label 'css-classes '("list-header"))
    (slot-set! root-vbox 'height-request 128)
    (slot-set! root-vbox 'width-request 128)
    (slot-set! root-vbox 'hexpand #f)
    (slot-set! root-vbox 'css-classes '("standings-list"))

    (gtk-box-append root-vbox div-label)

    (map (lambda (x) (add-standings-table root-vbox x)) (get-standings conf div))

    root-vbox))

(define (add-standings-table root-vbox standings-list)
  (let ( (hbox (make-instance <gtk-box> #:orientation 'horizontal #:homogenous #f))
        (logo (gtk-image-new-from-resource (format #f "/bad-cat/nfldb/~a/logo" (car standings-list))))
        (team-css (format #f "team_~a" (car standings-list)))
        (name (make-instance <gtk-label> #:label (format #f "~a" (car standings-list))))
        (score (make-instance <gtk-label> #:label (format #f "~a" (cdr (slot-ref (cdr standings-list) 'pct))))) )

   (slot-set! name 'width-request 48)
   (slot-set! name 'css-classes '("name-label"))
   (slot-set! name 'hexpand #t)
   (slot-set! name 'halign 2)
   (slot-set! logo 'width-request 32)
   (slot-set! logo 'height-request 32)
   (slot-set! logo 'css-classes '("standings-icon"))
   (slot-set! score 'halign 2)
   (slot-set! score 'hexpand #t)
   (slot-set! score 'css-classes '("score-label"))

   (let ( (b (make-instance <gtk-box>)) )
     (slot-set! b 'css-classes (list team-css))
     (gtk-box-append b logo)
     (gtk-box-append hbox b))
   (gtk-box-append hbox name)
   (gtk-box-append hbox score)
   (gtk-box-append root-vbox hbox)
   hbox))

