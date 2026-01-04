(define-module (bad-cat nfldb ui week-preview)
  #:use-module (oop goops)
  #:use-module (srfi srfi-19)
  #:use-module (g-golf)

  #:use-module (bad-cat utils)

  #:use-module (bad-cat nfldb ui init)

  #:use-module (bad-cat nfldb team)
  #:use-module (bad-cat nfldb cache league)

  #:use-module (bad-cat nfldb ui panels preview)

  ; #:export (nfldb-show-overview-for)
  #:export (nfldb-show-week-preview-for)
)

;; *********************************************************************************************************************
;; Startup Hook
;; *********************************************************************************************************************

(define (show-week-preview-window app year-no week-no)
  (let ( (window (make-instance <gtk-application-window>
                                      #:title (format #f "Preview : week ~a" week-no)
                                      #:icon "/bad-cat/nfldb/NFL"
                                      #:application app)) )
    (gtk-style-context-add-provider-for-display (gdk-display-get-default) nfldb-css-provider 0)
    (gtk-style-context-add-provider-for-display (gdk-display-get-default) team-css-provider 0)

    (slot-set! window 'resizable #f)

    (set-child window (get-preview-layout year-no week-no))

    (present window)))

;; *********************************************************************************************************************
;; Main entry point to start UI
;; *********************************************************************************************************************

(define (nfldb-show-week-preview-for year-no week-no)
  (define (proc app) (show-week-preview-window app year-no week-no))
  (if (and (>= week-no 0) (<= week-no 18))
    (let ( (app (make <gtk-application> #:application-id "bad-cat.nfldb.week-preview")) )
      (connect app 'activate proc)
      (g-application-run app '()))
    (begin
      (format #t "Week ~a is out of range (1 - 18)~%" week-no)
      #f)))

