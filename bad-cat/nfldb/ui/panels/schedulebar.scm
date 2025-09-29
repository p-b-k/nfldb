(define-module (bad-cat nfldb ui panels schedulebar)

  ;; *******************************************************************************************************************
  ;; A Division Panel listing the standings
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

  #:export (get-sched-panel)
)

(define (get-sched-panel team)
  (let ( (hbox  (make-instance <gtk-box> #:orientation 'horizontal #:homogenous #t)) )
    (define (add-schedule-entry game)
      (gtk-box-append hbox (create-schedule-entry-for-game team game))
      #t)
    (map add-schedule-entry (get-team-games (team.nick team) (current-season)))
    hbox))

(define (create-schedule-entry-for-game team game)
  (define (get-opponent)
    (if (eq? (game.home game) (team.nick team))
      (game.away game)
      (game.home game)))
  (define (get-resource)
    (if game
      (let ( (result (game.result game)) )
        (if result
          (if (game-tied? result)
            "tie"
            (if (game-winner? game result (team.nick team))
              "win"
              "lose"))
          "not-played"))
      "bye"))
  (let ( (res (format #f "/bad-cat/nfldb/~a" (get-resource)))
         (opp (if game (format #f "/bad-cat/nfldb/~a/logo" (get-opponent)) #f)) )
    (let ( (vbox  (make-instance <gtk-box> #:orientation 'vertical #:homogeneous #t))
           (status-image (gtk-image-new-from-resource res))
           (opponent-image (if opp (gtk-image-new-from-resource opp) (make-instance <gtk-image>))) )
      (slot-set! status-image 'height-request 32)
      (slot-set! status-image 'width-request  32)
      (slot-set! status-image 'css-classes '("schedule-record-entry"))
      (slot-set! opponent-image 'height-request 32)
      (slot-set! opponent-image 'width-request  32)
      (slot-set! opponent-image 'css-classes '("schedule-record-entry"))

      (gtk-box-append vbox opponent-image)
      (gtk-box-append vbox status-image)
      
      vbox)))

