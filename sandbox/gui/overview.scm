;; *********************************************************************************************************************
;; Test accessing data, parsing json, etc, from espn nfl api
;; *********************************************************************************************************************

(use-modules (oop goops))

(use-modules (srfi srfi-19))

(use-modules (g-golf))

(use-modules (data league))
(use-modules (data sched year-2025))
(use-modules (bad-cat nfldb ui init))

(use-modules (bad-cat utils))

; (use-modules (bad-cat nfldb json))
; (use-modules (bad-cat nfldb game))
(use-modules (bad-cat nfldb team))
; (use-modules (bad-cat nfldb schedule))
; (use-modules (bad-cat nfldb serialize))


; (use-modules (bad-cat nfldb data))
; (use-modules (bad-cat nfldb cache-datasource))

(use-modules (bad-cat nfldb ui panels main))

;; *********************************************************************************************************************
;; Startup Hook
;; *********************************************************************************************************************

(define (show-overview-window app team)
  (let ( (window (make-instance <gtk-application-window>
                                      #:title (format #f "Overview: ~a" (team.name team))
                                      #:icon "/bad-cat/nfldb/NFL"
                                      #:application app)) )
;   (slot-set! window 'default-height 400)
;   (slot-set! window 'default-width 600)

    (gtk-style-context-add-provider-for-display (gdk-display-get-default) nfldb-css-provider 0)
    (gtk-style-context-add-provider-for-display (gdk-display-get-default) team-css-provider 0)

    (set-child window (get-overview-layout team))

    (present window)))

;; *********************************************************************************************************************
;; Main entry point to start UI
;; *********************************************************************************************************************

(define (nfldb-show-overview)
  (define (proc app) (show-overview-window app (my-team)))
  (let ( (app (make <gtk-application> #:application-id "bad-cat.nfldb.overview")) )
    (connect app 'activate proc)
    (g-application-run app '())))

;; *********************************************************************************************************************
;; Set the caching data source
;; *********************************************************************************************************************

; (set-datasource (cache-datasource-new))

