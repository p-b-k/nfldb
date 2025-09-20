(define-module (bad-cat nfldb ui panels main)

  ;; *******************************************************************************************************************
  ;; Main Panel with home team info on top and general upcoming games of interest bellow
  ;; *******************************************************************************************************************

  #:use-module (oop goops)
  #:use-module (g-golf)

  #:use-module (bad-cat utils)

  #:use-module (bad-cat nfldb)
  #:use-module (bad-cat nfldb team)
  #:use-module (bad-cat nfldb game)
  #:use-module (bad-cat nfldb cache standings)
  #:use-module (bad-cat nfldb cache schedule)
  #:use-module (bad-cat nfldb cache result)

  #:export (get-overview-layout)
)

(define-method (get-overview-layout (t <nfl-team>))
  (let ( (banner (get-team-banner t))
         (game   (get-game-panel t))
         (sched  (get-sched-panel t))
         (div    (get-div-panel (team.conf t) (team.div t)))
         (conf   (get-conf-panel (team.conf t)))
         (team-css (format #f "team_~a" (team.nick t))) )
    (let ( (root-grid (make-instance <gtk-grid> #:halign 'center #:valign 'center))
           (team-hbox (make-instance <gtk-box> #:orientation 'horizontal #:homogenous #f))
           (div-hbox  (make-instance <gtk-box> #:orientation 'horizontal #:homogenous #f))
           (league-hbox  (make-instance <gtk-box> #:orientation 'horizontal #:homogenous #f)) )
      (slot-set! banner 'height-request 96)
      (slot-set! banner 'vexpand #f)
      (slot-set! banner 'valign 1)

;     (slot-set! team-hbox 'css-classes (list team-css))
      (slot-set! game 'valign 0)

;     (gtk-box-append team-hbox banner)
;     (gtk-box-append team-hbox game)
      
      (slot-set! div-hbox 'vexpand #f)
      (slot-set! div-hbox 'hexpand #t)

      (gtk-box-append div-hbox div)
      (gtk-box-append div-hbox conf)

;     (gtk-grid-attach root-grid team-hbox 0 0 2 1)
      (gtk-grid-attach root-grid banner 0 0 2 1)
      (gtk-grid-attach root-grid game 2 0 1 1)

      (slot-set! sched 'css-classes `("schedule-bar"))
      (slot-set! sched 'halign 'center)
      (gtk-grid-attach root-grid sched 0 1 3 1)

      (gtk-grid-attach root-grid div-hbox 0 2 1 1)
      (gtk-grid-attach root-grid league-hbox 1 2 2 1)
      
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
    (slot-set! root-vbox 'css-classes '("standings-list"))

    (gtk-box-append root-vbox div-label)

    (map (lambda (x)
           (let ( (hbox (make-instance <gtk-box> #:orientation 'horizontal #:homogenous #f))
                  (logo (gtk-image-new-from-resource (format #f "/bad-cat/nfldb/~a/logo" (car x))))
                  (team-css (format #f "team_~a" (car x)))
                  (name (make-instance <gtk-label> #:label (format #f "~a" (car x))))
                  (score (make-instance <gtk-label> #:label (format #f "~a" (cdr (slot-ref (cdr x) 'pct))))) )

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
         (get-standings conf div))

    root-vbox))

(define (create-schedule-entry-for-game team game)
  (define (get-resource)
    (if game
      (let ( (result (game.result game)) )
        (if result
          (if (game-tied? result)
            "tied"
            (if (game-winner? game result (team.nick team))
              "win"
              "lose"))
          "not-played"))
      "bye"))
  (let ( (res (format #f "/bad-cat/nfldb/~a" (get-resource))) )
    (let ( (image (gtk-image-new-from-resource res)) )
      (slot-set! image 'height-request 32)
      (slot-set! image 'width-request  32)
      (slot-set! image 'css-classes '("schedule-record-entry"))
      image)))

(define (get-sched-panel team)
  (let ( (hbox  (make-instance <gtk-box> #:orientation 'horizontal #:homogenous #t)) )
    (define (add-schedule-entry game)
      (gtk-box-append hbox (create-schedule-entry-for-game team game))
      #t)
    (map add-schedule-entry (get-team-games (team.nick team) (current-season)))
    hbox))
(define (get-conf-panel conf) (make-instance <gtk-label> #:label (format #f "Conference Panel (~a)" conf)))

