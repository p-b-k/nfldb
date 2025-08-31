(define-module (bad-cat nfldb team)

  ;; *******************************************************************************************************************
  ;; Define the team object and associated methods
  ;; *******************************************************************************************************************

  #:use-module (oop goops)

  #:export (get-team)
  #:export (get-conf)
  #:export (get-div)

  #:export (<nfl-team>)
  #:export (team-name<?)
  #:export (all-nfl-teams)
  #:export (team.nick)
)

(define-class <nfl-team> ()
  (espn-id        #:init-keyword  #:id
                  #:getter        team.id)
  (nickname       #:init-keyword  #:nick
                  #:getter        team.nick)
  (conference     #:init-keyword  #:conf
                  #:getter        team.conf)
  (division       #:init-keyword  #:div
                  #:getter        team.div)
)

(define teams (make-hash-table))
(define conferences (make-hash-table))

(define (get-team nick) (hash-ref teams nick))
(define (get-conf c) (apply append (hash-map->list (lambda (a b) b) (hash-ref conferences c))))
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
  (hash-map->list (lambda (a b) b) conferences))


