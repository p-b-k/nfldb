(define-module (bad-cat nfldb ui)
  #:use-module (oop goops)
  #:use-module (srfi srfi-19)
  #:use-module (g-golf)

  #:use-module (bad-cat utils)

  #:use-module (bad-cat nfldb ui init)

  #:use-module (bad-cat nfldb team)
  #:use-module (bad-cat nfldb cache league)

  #:use-module (bad-cat nfldb ui panels dashboard)

  #:export (nfldb-show-overview-for)
  #:export (nfldb-show-overview)

  #:export (nfldb-show-preview)
)

;; *********************************************************************************************************************
;; Startup Hook
;; *********************************************************************************************************************

(define (show-overview-window app team)
  (let ( (window (make-instance <gtk-application-window>
                                      #:title (format #f "Overview: ~a" (team.name team))
                                      #:icon "/bad-cat/nfldb/NFL"
                                      #:application app)) )
    (gtk-style-context-add-provider-for-display (gdk-display-get-default) nfldb-css-provider 0)
    (gtk-style-context-add-provider-for-display (gdk-display-get-default) team-css-provider 0)

    (slot-set! window 'resizable #f)

    (set-child window (get-overview-layout team))

    (present window)))

(define (show-preview-window app year-no week-no)
  (let ( (window (make-instance <gtk-application-window>
                                      #:title (format #f "Week ~a of ~a Season" week-no year-no)
                                      #:icon "/bad-cat/nfldb/NFL"
                                      #:application app)) )
    (gtk-style-context-add-provider-for-display (gdk-display-get-default) nfldb-css-provider 0)
    (gtk-style-context-add-provider-for-display (gdk-display-get-default) team-css-provider 0)

    (slot-set! window 'resizable #f)

    (set-child window (get-overview-layout team))

    (present window)))

;; *********************************************************************************************************************
;; Main entry point to start UI
;; *********************************************************************************************************************

(define (nfldb-show-overview-for team-nick)
  (let ( (team (get-team team-nick)) )
    (define (proc app) (show-overview-window app team))
    (if team
      (let ( (app (make <gtk-application> #:application-id "bad-cat.nfldb.overview")) )
        (connect app 'activate proc)
        (g-application-run app '()))
      (begin
        (format #t "No team found for ~a~%" team-nick)
        #f))))

(define (nfldb-show-overview) (nfldb-show-overview-for (team.nick (my-team))))

(define (nfldb-show-preview year week)
  (let ( (app (make <gtk-application> #:application-id "bad-cat.nfldb.preview")) )
    (connect app 'activate (show-preview-window app year week))
    (g-application-run app '())))
