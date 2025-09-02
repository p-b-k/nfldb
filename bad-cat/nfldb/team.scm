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
  #:export (all-nfl-teams)

  #:export (team.nick)
  #:export (team.name)
  #:export (team.id)
  #:export (team.conf)
  #:export (team.div)
  #:export (team.color)
  #:export (team.alt-color)

  #:export (set-my-team)
  #:export (my-team)

  #:export (conf->index)
  #:export (div->index)

  #:export (<nfl-team-record>)
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

(define teams (make-hash-table))
(define conferences (make-hash-table))

(define (conf->index conf)
  (case conf
    ( (afc AFC) 0 )
    ( (nfc NFC) 1 )
    ( else (throw 'invalid-conference conf) )))

(define (div->index div)
  (case div
    ( (east EAST)   0 )
    ( (north NORTH) 1 )
    ( (south SOUTH) 2 )
    ( (west WEST)   3 )
    ( else (throw 'invalid-division div) )))

(define (get-team nick) (hash-ref teams nick))
(define (get-conf c) (apply append (hash-map->list _2nd (hash-ref conferences c))))
(define (get-div c d) (hash-ref (hash-ref conferences c)  d))

(let ( (afc (make-hash-table))
       (nfc (make-hash-table)) )
  (hash-set! conferences 'AFC afc)
  (hash-set! conferences 'NFC nfc)
  (map (lambda (x)
         (map (lambda (y) (hash-set! x y '()))
              '(NORTH SOUTH EAST WEST)))
       (list afc nfc)))
  
(define (register-team t)
  (if (hash-ref teams (team.nick t)) (throw 'team-already-registered (team.nick t) t (hash-ref teams t)))
  (hash-set! teams (team.nick t) t)
  (hash-set! teams (team.id t) t)
  (hash-set! (hash-ref conferences (team.conf t))
             (team.div t)
             (cons t (hash-ref (hash-ref conferences (team.conf t)) (team.div t)))))

(define-method (initialize (t <nfl-team>) args)
  (next-method)
  (register-team t))

(define-method (write (t <nfl-team>) (o <output-port>))
  (format o "~a~a~a" #\x169c (team.nick t) #\x169b))

(define-method (team-name<? (a <nfl-team>) (b <nfl-team>))
  (string<? (symbol->string (team.nick a))
            (symbol->string (team.nick b))))

(define (all-nfl-teams)
  (sort (apply append (apply append (map (lambda (x) (hash-map->list _2nd x)) (hash-map->list _2nd conferences))))
        team-name<?))

(define my-team-param (make-parameter 'PHI))

(define (set-my-team team-name)
  (let ( (team (get-team team-name)) )
    (if team
      (my-team-param (team.nick team))
      (throw 'undefined-team team-name))))

(define (my-team) (get-team (my-team-param)))

(define-class <nfl-team-record> () w l t pct home away div conf pf pa diff strk)
