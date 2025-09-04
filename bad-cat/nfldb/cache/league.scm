(define-module (bad-cat nfldb cache league)

  ;; *******************************************************************************************************************
  ;; Cache for League data
  ;; Very static. Might change yearly.
  ;; *******************************************************************************************************************

  #:use-module (oop goops)

  #:use-module (bad-cat nfldb cache)

  #:export (conf->index)
  #:export (div->index)

  #:export (all-nfl-teams)
)

(define-class <league-cache> <nfldb-cache>)
  (teams          #:init-thunk      make-hash-table
                  #:getter          league.teams
                  #:setter          league.teams!)
  (conferences    #:init-thunk      make-hash-table
                  #:getter          league.conferences
                  #:setter          league.conferences!)
)

(define-method (clear-cache (c <league-cache>))
  (slot-set! c 'teams (make-hash-table))
  (slot-set! c 'conferences (make-hash-table)))

;; Leave this as is, as this should only be updated when forced to
;; (define-method (cache-out-of-date? (c <league-cache>)) #f)

;; (define-method (cache-out-of-date? (c <league-cache>)) #f)
(define-method (cache-sync! (l <league-cache>))
  (clear-cache l)
  (map (lambda (t) (register-team l t)) (espn-get-teams))
  #t)


(define (espn-get-teams)
  (let ( (json (espn-get-page espn-host-core "v2/sports/football/leagues/nfl/teams?limit=320" port->json-obj)) )
    (let ( (team-urls (map (lambda (x) (json-ref $ref x)) (json-ref items json))) )
      (map slurp-team team-urls))))

(define (slurp-team team-url)
  (let ( (json (espn-get-url team-url port->json-obj)) )
    (let ( (division (lookup-division (json-ref groups.$ref json))) )
      (let ( (id (string->number (json-ref id json))) )
        (if (not (get-team id))
          (make-instance <nfl-team>
                         #:id id
                         #:nick (string->symbol (json-ref abbreviation json))
                         #:name (json-ref name json)
                         #:color (read-espn-color (json-ref color json))
                         #:alt-color (read-espn-color (json-ref alternateColor json))
                         #:conf (car division)
                         #:div (cdr division)))))))

(define (register-team l t)
  (let ( (teams (league.teams l)) )
    (if (hash-ref teams (team.nick t)) (throw 'team-already-registered (team.nick t) t (hash-ref teams t)))
    (hash-set! teams (team.nick t) t)
    (hash-set! teams (team.id t) t)
    (hash-set! (hash-ref conferences (team.conf t))
               (team.div t)
               (cons t (hash-ref (hash-ref conferences (team.conf t)) (team.div t))))))

(define (all-nfl-teams)
  (sort (apply append
               (apply append
                      (map (lambda (x) (hash-map->list _2nd x))
                                         (hash-map->list _2nd conferences))))
        team-name<?))

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

