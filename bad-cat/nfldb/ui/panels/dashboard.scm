(define-module (bad-cat nfldb ui panels dashboard)

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

  #:use-module (bad-cat nfldb ui panels divpanel)
  #:use-module (bad-cat nfldb ui panels schedulebar)

  #:export (get-overview-layout)
)

(define-method (get-overview-layout (t <nfl-team>))
  (let ( (banner (get-team-banner t))
         (game   (get-next-game-panel t))
         (sched  (get-sched-panel t))
         (div    (get-div-panel (team.conf t) (team.div t)))
         (conf   (get-conf-panel (team.conf t) (team.div t)))
         (team-css (format #f "team_~a" (team.nick t))) )
    (let ( (root-grid (make-instance <gtk-grid> #:halign 'center #:valign 'center))
           (team-hbox (make-instance <gtk-box> #:orientation 'horizontal #:homogenous #f))
           (div-hbox  (make-instance <gtk-box> #:orientation 'horizontal #:homogenous #f))
           (league-hbox  (make-instance <gtk-box> #:orientation 'horizontal #:homogenous #f)) )
      (slot-set! banner 'height-request 128)
      (slot-set! banner 'vexpand #f)
      (slot-set! banner 'valign 1)

      (slot-set! game 'valign 0)

      (slot-set! div-hbox 'vexpand #f)
      (slot-set! div-hbox 'hexpand #t)

      (gtk-box-append div-hbox div)
      (gtk-box-append div-hbox conf)

      (slot-set! game 'valign 4)

      (slot-set! sched 'css-classes `("schedule-bar"))
      (slot-set! sched 'halign 'center)

      (gtk-grid-attach root-grid banner       0 0 2 1)
      (gtk-grid-attach root-grid game         4 0 1 3)
      (gtk-grid-attach root-grid sched        0 1 2 1)
      (gtk-grid-attach root-grid div-hbox     0 2 1 1)
      (gtk-grid-attach root-grid league-hbox  1 2 2 1)

      root-grid)))

(define (get-team-banner team)
  (let ( (hbox (make-instance <gtk-box> #:orientation 'horizontal #:homogenous #f))
         (logo-image (gtk-image-new-from-resource (format #f "/bad-cat/nfldb/~a/logo" (team.nick team))))
         (name-vbox (make-instance <gtk-box> #:orientation 'vertical #:homogeneous #f))
         (name-label (make-instance <gtk-label> #:label (team.name team)))
         (location-label (make-instance <gtk-label> #:label (team.location team)))
         (team-css (format #f "team_~a" (team.nick team))) )
      (slot-set! name-vbox 'css-classes `("team-id-box" ,(format #f "team_~a" (team.nick team))))
      (slot-set! name-vbox 'width-request 512)

      (slot-set! logo-image 'height-request 128)
      (slot-set! logo-image 'width-request 128)

      (slot-set! logo-image 'hexpand #f)
      (slot-set! logo-image 'vexpand #t)
      (slot-set! logo-image 'valign 1)

      (slot-set! name-vbox 'css-classes       `("team-id-box"))
      (slot-set! name-label 'css-classes      '("team-id-name"))
      (slot-set! location-label 'css-classes  '("team-id-location"))

      (slot-set! hbox 'vexpand #f)
;     (slot-set! hbox 'css-classes (list team-css))
      (slot-set! hbox 'height-request 128)

      (gtk-box-append hbox logo-image)
      (gtk-box-append name-vbox name-label)
      (gtk-box-append name-vbox location-label)
      (gtk-box-append hbox name-vbox)
;     (gtk-box-append hbox word-picture)

      hbox))

(define (get-next-game-panel team)
  (let ( (record-label  (make-instance <gtk-label>  #:label "Record to Date"))
         (record-panel  (make-instance <gtk-label>))
         (time-to-game  (make-instance <gtk-label>  #:label "Time to next game"))
         (days-label    (make-instance <gtk-label>  #:label "Days"))
         (hours-label   (make-instance <gtk-label>  #:label "Hours"))
         (mins-label    (make-instance <gtk-label>  #:label "Minutes"))
         (secs-label    (make-instance <gtk-label>  #:label "Seconds"))
         (days-val      (make-instance <gtk-label>))
         (hours-val     (make-instance <gtk-label>))
         (mins-val      (make-instance <gtk-label>))
         (secs-val      (make-instance <gtk-label>)) )

    (let ( (grid (make-instance <gtk-grid>
                                #:row-homogenous    #f
                                #:row-spacing       2
                                #:column-homogenous #f
                                #:column-spacing    2)) )
      (slot-set! record-label 'css-classes '("list-header"))
      (slot-set! record-panel 'css-classes '("game-status"))
      (slot-set! time-to-game 'css-classes '("list-header"))
      (slot-set! days-label   'xalign 0)
      (slot-set! hours-label  'xalign 0)
      (slot-set! mins-label   'xalign 0)
      (slot-set! secs-label   'xalign 0)
      (slot-set! days-val     'xalign 1)
      (slot-set! hours-val    'xalign 1)
      (slot-set! mins-val     'xalign 1)
      (slot-set! secs-val     'xalign 1)
      (slot-set! days-val     'css-classes '("to-game" "game-status"))
      (slot-set! hours-val    'css-classes '("to-game" "game-status"))
      (slot-set! mins-val     'css-classes '("to-game" "game-status"))
      (slot-set! secs-val     'css-classes '("to-game" "game-status"))
      (slot-set! grid         'vexpand #f)
      (slot-set! grid         'width-request 96)


      (let ( (record (get-team-record (team.nick team))) )
        (slot-set! record-panel 'label (format #f "~a - ~a" (car (slot-ref record 'w)) (car (slot-ref record 'l)))))

      (let ( (game (get-next-game (team.nick team))) )
        (let ( (hms (seconds->hms (- (gametime->secs (game.time game)) (current-time)))) )
          (slot-set! days-val   'label (number->string (list-ref hms 0)))
          (slot-set! hours-val  'label (number->string (list-ref hms 1)))
          (slot-set! mins-val   'label (number->string (list-ref hms 2)))
          (slot-set! secs-val   'label (number->string (list-ref hms 3)))))

      (gtk-grid-attach grid record-label 0 0 2 1)
      (gtk-grid-attach grid record-panel 0 1 2 1)
      (gtk-grid-attach grid time-to-game 0 2 2 1)
      (gtk-grid-attach grid days-label   0 3 1 1)
      (gtk-grid-attach grid hours-label  0 4 1 1)
      (gtk-grid-attach grid mins-label   0 5 1 1)
      (gtk-grid-attach grid secs-label   0 6 1 1)
      (gtk-grid-attach grid days-val     1 3 1 1)
      (gtk-grid-attach grid hours-val    1 4 1 1)
      (gtk-grid-attach grid mins-val     1 5 1 1)
      (gtk-grid-attach grid secs-val     1 6 1 1)

      grid)))

(define (get-conf-panel conf div)
  (let ( (grid (make-instance <gtk-grid>
                              #:row-homogenous    #f
                              #:row-spacing       2
                              #:column-homogenous #t
                              #:column-spacing    20)) )
    (let ( (divs (filter (lambda (x) (not (eq? div x))) '(EAST NORTH SOUTH WEST))) )
      (let ( (lists (map (lambda (x)
                           (let ( (standings (get-standings conf x))
                                 (vbox      (make-instance <gtk-box> #:homogenous #f #:orientation 'vertical)) )
                             (gtk-box-append vbox (get-div-panel conf x))
                             vbox))
                         divs)) )
        (define (add-divs index todo)
          (if (not (null? todo))
            (let ( (next-div (car todo)) )
              (gtk-grid-attach grid next-div index 0 1 1)
              (add-divs (1+ index) (cdr todo)))))
        (add-divs 0 lists)))
    grid))

