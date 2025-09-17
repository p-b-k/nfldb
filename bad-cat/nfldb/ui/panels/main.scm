(define-module (bad-cat nfldb ui panels main)

  ;; *******************************************************************************************************************
  ;; Main Panel with home team info on top and general upcoming games of interest bellow
  ;; *******************************************************************************************************************

  #:use-module (oop goops)
  #:use-module (g-golf)

  #:use-module (bad-cat utils)

  #:use-module (bad-cat nfldb team)
  #:use-module (bad-cat nfldb cache standings)

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
      (slot-set! banner 'height-request 96)
      (slot-set! banner 'vexpand #f)
      (slot-set! banner 'valign 1)

;     (slot-set! team-hbox 'css-classes (list "test-a"))
;     (slot-set! banner 'css-classes (list "test-c"))
;     (slot-set! game 'css-classes (list "test-b"))
      (slot-set! game 'valign 0)

      (gtk-box-append team-hbox banner)
      (gtk-box-append team-hbox game)
      
      (slot-set! div-hbox 'vexpand #f)
      (slot-set! div-hbox 'hexpand #t)

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
         (word-picture (gtk-picture-new-for-resource (format #f "/bad-cat/nfldb/~a/title" (team.nick team)))) )
      (slot-set! logo-image 'height-request 64)
      (slot-set! logo-image 'width-request 64)
      (slot-set! word-image 'height-request 96)
;     (slot-set! word-image 'width-request 64)

      (slot-set! logo-image 'hexpand #f)
      (slot-set! logo-image 'vexpand #t)
      (slot-set! logo-image 'valign 1)

      (slot-set! word-picture 'hexpand #t)
      (slot-set! word-picture 'vexpand #t)
      (slot-set! word-picture 'keep-aspect-ratio #t)
      (slot-set! word-picture 'valign 1)
      (slot-set! hbox 'vexpand #f)

      (gtk-box-append hbox logo-image)
      (gtk-box-append hbox word-picture)

      hbox))

(define (get-game-panel team)
  (let ( (vbox (make-instance <gtk-box> #:orientation 'vertical #:homogenous #f))
         (record-label (make-instance <gtk-label> #:label "0 - 0"))
         (status-label (make-instance <gtk-label> #:label "No Game Playing")) )
    (slot-set! vbox 'css-classes '("game-status"))
    (slot-set! vbox 'vexpand #f)
    (slot-set! vbox 'height-request 96)
    (gtk-box-append vbox record-label)
    (gtk-box-append vbox status-label)
    vbox))

(define (get-div-panel conf div)
  (let ( (root-vbox (make-instance <gtk-box> #:orientation 'vertical #:homogenous #f)) 
         (div-label (make-instance <gtk-label> #:label (format #f "~a ~a" conf div))) )
    (slot-set! div-label 'css-classes '("list-header"))
    (slot-set! root-vbox 'height-request 128)
    (slot-set! root-vbox 'width-request 128)
    (slot-set! root-vbox 'hexpand #f)

    (gtk-box-append root-vbox div-label)

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
             (gtk-box-append root-vbox hbox)
             hbox))
         (get-standings conf div))

    root-vbox))

(define (get-sched-panel team)
  (let ( (label (make-instance <gtk-label> #:label (format #f "Schedule Panel (~a)" (team.name team)))) )
    (slot-set! label 'vexpand #f)
    label))
(define (get-conf-panel conf) (make-instance <gtk-label> #:label (format #f "Conference Panel (~a)" conf)))

