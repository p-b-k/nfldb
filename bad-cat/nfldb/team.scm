(define-module (bad-cat nfldb team)

  ;; *******************************************************************************************************************
  ;; Define the team object and associated methods
  ;; *******************************************************************************************************************

  #:use-module (oop goops)

  #:use-module (bad-cat utils)

  #:export (get-team)
  #:export (get-conf)
  #:export (get-div)

  #:export (<nfl-team>)
  #:export (team-name<?)

  #:export (team.nick)
  #:export (team.name)
  #:export (team.id)
  #:export (team.conf)
  #:export (team.div)
  #:export (team.color)
  #:export (team.alt-color)

  #:export (set-my-team)
  #:export (my-team)

  #:export (<nfl-team-record>)

  ;; Temp
  #:export (write-team-css-style)
)

(define-class <nfl-team> ()
  (espn-id        #:init-keyword  #:id
                  #:getter        team.id)
  (nickname       #:init-keyword  #:nick
                  #:getter        team.nick)
  (name           #:init-keyword  #:name
                  #:getter        team.name)
  (conference     #:init-keyword  #:conf
                  #:getter        team.conf)
  (division       #:init-keyword  #:div
                  #:getter        team.div)
  (color          #:init-keyword  #:color
                  #:getter        team.color)
  (alt-color      #:init-keyword  #:alt-color
                  #:getter        team.alt-color)
)

(let ( (afc (make-hash-table))
       (nfc (make-hash-table)) )
  (hash-set! conferences 'AFC afc)
  (hash-set! conferences 'NFC nfc)
  (map (lambda (x)
         (map (lambda (y) (hash-set! x y '()))
              '(NORTH SOUTH EAST WEST)))
       (list afc nfc)))
  
; (define-method (initialize (t <nfl-team>) args)
;   (next-method)
;   (register-team t))

(define-method (write (t <nfl-team>) (o <output-port>))
  (format o "~a~a~a" #\x169c (team.nick t) #\x169b))

(define-method (team-name<? (a <nfl-team>) (b <nfl-team>))
  (string<? (symbol->string (team.nick a))
            (symbol->string (team.nick b))))

(define my-team-param (make-parameter 'PHI))

(define (set-my-team team-name)
  (let ( (team (get-team team-name)) )
    (if team
      (my-team-param (team.nick team))
      (throw 'undefined-team team-name))))

(define (my-team) (get-team (my-team-param)))

(define-class <nfl-team-record> () w l t pct home away div conf pf pa diff strk)

(define (write-team-css-style team)
  (format #t ".team_~a * {~%" (team.nick team))
  (format #t "  background            : ~a;~%" (html-color (team.color team)))
  (format #t "  color                 : ~a;~%" (html-color (team.alt-color team)))
  (format #t "}~%")
  (format #t "~%")
  (format #t ".team_~a_alt * {~%" (team.nick team))
  (format #t "  background            : ~a;~%" (html-color (team.alt-color team)))
  (format #t "  color                 : ~a;~%" (html-color (team.color team)))
  (format #t "}~%")
  (format #t "~%"))
