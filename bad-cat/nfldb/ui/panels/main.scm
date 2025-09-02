(define-module (bad-cat nfldb ui panels main)

  ;; *******************************************************************************************************************
  ;; Main Panel with home team info on top and general upcoming games of interest bellow
  ;; *******************************************************************************************************************

  #:use-module (oop goops)
  #:use-module (g-golf)

  #:use-module (bad-cat utils)

  #:use-module (bad-cat nfldb team)
  #:use-module (bad-cat nfldb data)

  #:export (get-overview-layout)
)

(define-method (get-overview-layout (t <nfl-team>))
  (let ( (banner (get-team-banner t))
         (game   (get-game-panel t))
         (sched  (get-sched-panel t))
         (div    (get-div-panel (team.conf t) (team.div t)))
         (conf   (get-conf-panel (team.conf t))) )
    (let ( (root-vbox (make-instance <gtk-box> #:orientation 'vertical #:homogenous #f))
           (team-hbox (make-instance <gtk-box> #:orientation 'horizontal #:homogenous #f))
           (div-hbox  (make-instance <gtk-box> #:orientation 'horizontal #:homogenous #f))
           (league-hbox  (make-instance <gtk-box> #:orientation 'horizontal #:homogenous #f)) )
      (gtk-box-append team-hbox banner)
      (gtk-box-append team-hbox game)

      (gtk-box-append div-hbox div)
      (gtk-box-append div-hbox conf)

      (gtk-box-append root-vbox team-hbox)
      (gtk-box-append root-vbox sched)
      (gtk-box-append root-vbox div-hbox)
      (gtk-box-append root-vbox league-hbox)
      
      root-vbox)))

(define (get-team-banner team)
  (let ( (hbox (make-instance <gtk-box> #:orientation 'horizontal #:homogenous #f))
         (logo-image (gtk-image-new-from-resource (format #f "/bad-cat/nfldb/~a/logo" (team.nick team))))
         (word-image (gtk-image-new-from-resource (format #f "/bad-cat/nfldb/~a/title" (team.nick team))))
         (class-name (format #f "team_~a_reverse" (team.nick team))) )
      (slot-set! logo-image 'height-request 64)
      (slot-set! logo-image 'width-request 128)
      (slot-set! word-image 'height-request 128)
      (slot-set! word-image 'width-request 512)
      (slot-set! word-image 'hexpand #t)
      (slot-set! word-image 'vexpand #f)

      (format #t "class-name = ~a~%" class-name)
      (slot-set! hbox 'css-classes (list class-name))
;     (slot-set! logo-image 'css-classes (list class-name))
;     (slot-set! word-image 'css-classes (list class-name))

      (gtk-box-append hbox logo-image)
      (gtk-box-append hbox word-image)
      hbox))

(define (get-game-panel team)
  (let ( (vbox (make-instance <gtk-box> #:orientation 'vertical #:homogenous #f))
         (record-label (make-instance <gtk-label>))
         (status-label (make-instance <gtk-label> #:label "No Game Playing")) )
    (gtk-box-append vbox record-label)
    (gtk-box-append vbox status-label)
    vbox))

(define (get-div-panel conf div)
  (let ( (root-vbox (make-instance <gtk-box> #:orientation 'vertical #:homogenous #f)) 
         (div-label (make-instance <gtk-label> #:label (format #f "~a ~a" conf div)))
;        (scrolled  (make-instance <gtk-scrolled-window>))
         (list-view (make-instance <gtk-list-box>)) )
    (slot-set! div-label 'css-classes '("list-header"))
    (slot-set! root-vbox 'height-request 128)
    (slot-set! root-vbox 'width-request 128)

    ;(slot-set! scrolled 'vexpand #t)
    (slot-set! list-view 'height-request 86)

;   (gtk-scrolled-window-set-child scrolled list-view)
    (gtk-box-append root-vbox div-label)
    (gtk-box-append root-vbox list-view)

    (map (lambda (x)
           (let ( (hbox (make-instance <gtk-box> #:orientation 'horizontal #:homogenous #f))
                  (logo (gtk-image-new-from-resource (format #f "/bad-cat/nfldb/~a/logo" (car x))))
                  (name (make-instance <gtk-label> #:label (format #f "~a" (car x))))
                  (score (make-instance <gtk-label> #:label (format #f "~a" (cdr (slot-ref (cdr x) 'pct))))) )

             (slot-set! name 'width-request 64)
             (slot-set! score 'halign 2)
             (slot-set! score 'hexpand #t)

             (gtk-box-append hbox logo)
             (gtk-box-append hbox name)
             (gtk-box-append hbox score)
             (gtk-list-box-append list-view hbox)
             hbox))
         (ds-get-standings conf div))

    root-vbox))

(define (get-sched-panel team) (make-instance <gtk-label> #:label (format #f "Schedule Banner (~a)" (team.name team))))
(define (get-conf-panel conf) (make-instance <gtk-label> #:label (format #f "Conference Banner (~a)" conf)))

