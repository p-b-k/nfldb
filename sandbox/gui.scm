;; *********************************************************************************************************************
;; Test accessing data, parsing json, etc, from espn nfl api
;; *********************************************************************************************************************

(use-modules (oop goops))

(use-modules (srfi srfi-19))

(use-modules (web client))
(use-modules (web response))

(use-modules (bad-cat nfldb json))
(use-modules (bad-cat nfldb game))
(use-modules (bad-cat nfldb team))
(use-modules (bad-cat nfldb serialize))

(use-modules (bad-cat nfldb data league))


(use-modules (g-golf))
(use-modules (bad-cat nfldb ui init))

(use-modules (bad-cat nfldb data))
(use-modules (bad-cat nfldb espn))
(use-modules (bad-cat nfldb cache))

(g-resources-register (g-resource-load (format #f "~a/~a" (getenv "NFLDB_DIR") "nfldb.gresource")))

(define (populate-main-grid main-grid)
  (define (get-logo team)
    (let ( (image (gtk-image-new-from-resource (format #f "/bad-cat/nfldb/~a/logo" team))) )
      (slot-set! image 'height-request 64)
      (slot-set! image 'width-request 64)
      image))
  (define (make-div-grid) (make-instance <gtk-grid>
                                         #:halign 'center
                                         #:valign 'center
                                         #:row-spacing 0
                                         #:column-spacing 0
                                         #:row-homogenous #t
                                         #:column-homogenous #t))
  (let ( (afc-e (make-div-grid))
         (afc-n (make-div-grid))
         (afc-s (make-div-grid))
         (afc-w (make-div-grid))
         (nfc-e (make-div-grid))
         (nfc-n (make-div-grid))
         (nfc-s (make-div-grid))
         (nfc-w (make-div-grid)) )
    (gtk-grid-attach main-grid afc-n 0 0 4 1)
    (gtk-grid-attach afc-n (get-logo 'BAL) 0 0 1 1)
    (gtk-grid-attach afc-n (get-logo 'CIN) 1 0 1 1)
    (gtk-grid-attach afc-n (get-logo 'CLE) 2 0 1 1)
    (gtk-grid-attach afc-n (get-logo 'PIT) 3 0 1 1)

    (gtk-grid-attach main-grid afc-w 0 1 2 2)
    (gtk-grid-attach afc-w (get-logo 'DEN) 0 0 1 1)
    (gtk-grid-attach afc-w (get-logo 'KC)  0 1 1 1)
    (gtk-grid-attach afc-w (get-logo 'LAC) 1 0 1 1)
    (gtk-grid-attach afc-w (get-logo 'LV)  1 1 1 1)

    (gtk-grid-attach main-grid afc-e 2 1 2 2)
    (gtk-grid-attach afc-e (get-logo 'BUF) 0 0 1 1)
    (gtk-grid-attach afc-e (get-logo 'MIA) 0 1 1 1)
    (gtk-grid-attach afc-e (get-logo 'NE)  1 0 1 1)
    (gtk-grid-attach afc-e (get-logo 'NYJ) 1 1 1 1)

    (gtk-grid-attach main-grid afc-s 0 3 4 1)
    (gtk-grid-attach afc-s (get-logo 'HOU) 0 0 1 1)
    (gtk-grid-attach afc-s (get-logo 'IND) 1 0 1 1)
    (gtk-grid-attach afc-s (get-logo 'JAX) 2 0 1 1)
    (gtk-grid-attach afc-s (get-logo 'TEN) 3 0 1 1)

    (gtk-grid-attach main-grid nfc-n 4 0 4 1)
    (gtk-grid-attach nfc-n (get-logo 'CHI) 0 0 1 1)
    (gtk-grid-attach nfc-n (get-logo 'DET) 1 0 1 1)
    (gtk-grid-attach nfc-n (get-logo 'GB)  2 0 1 1)
    (gtk-grid-attach nfc-n (get-logo 'MIN) 3 0 1 1)

    (gtk-grid-attach main-grid nfc-w 4 1 2 2)
    (gtk-grid-attach nfc-w (get-logo 'ARI) 0 0 1 1)
    (gtk-grid-attach nfc-w (get-logo 'LAR) 0 1 1 1)
    (gtk-grid-attach nfc-w (get-logo 'SEA) 1 0 1 1)
    (gtk-grid-attach nfc-w (get-logo 'SF)  1 1 1 1)

    (gtk-grid-attach main-grid nfc-e 6 1 2 2)
    (gtk-grid-attach nfc-e (get-logo 'DAL) 0 0 1 1)
    (gtk-grid-attach nfc-e (get-logo 'NYG) 0 1 1 1)
    (gtk-grid-attach nfc-e (get-logo 'PHI) 1 0 1 1)
    (gtk-grid-attach nfc-e (get-logo 'WSH) 1 1 1 1)

    (gtk-grid-attach main-grid nfc-s 4 3 4 1)
    (gtk-grid-attach nfc-s (get-logo 'ATL) 0 0 1 1)
    (gtk-grid-attach nfc-s (get-logo 'CAR) 1 0 1 1)
    (gtk-grid-attach nfc-s (get-logo 'NO)  2 0 1 1)
    (gtk-grid-attach nfc-s (get-logo 'TB)  3 0 1 1)))

(define (start-nfldb app)
  (let ( (main-grid (make-instance <gtk-grid>
                                   #:row-spacing 64
                                   #:column-spacing 64
                                   #:row-homogenous #t
                                   #:column-homogenous #t)) )
    (populate-main-grid main-grid)
    (let ( (window (make-instance <gtk-application-window>
                                  #:title "NFLDB Main Window"
                                  #:icon "/bad-cat/nfldb/NFL"
                                  #:application app)) )
      (set-child window main-grid)
      (present window))))

(define (main . args)
  (let ( (app (make <gtk-application> #:application-id "bad-cat.nfldb.gui")) )
    (connect app 'activate start-nfldb)
    (g-application-run app '())))

(set-datasource (cache-datasource-new))

