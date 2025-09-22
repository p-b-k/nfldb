;; *********************************************************************************************************************
;; Test accessing data, parsing json, etc, from espn nfl api
;; *********************************************************************************************************************

(use-modules (oop goops))

(use-modules (srfi srfi-19))

(use-modules (g-golf))

(use-modules (bad-cat nfldb ui init))

(use-modules (bad-cat utils))

(use-modules (bad-cat nfldb team))


(use-modules (bad-cat nfldb ui panels dashboard))

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

;; *********************************************************************************************************************
;; Set the caching data source
;; *********************************************************************************************************************

