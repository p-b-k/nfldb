(define-module (bad-cat nfldb cache standings)

  ;; *******************************************************************************************************************
  ;; Cache for Schedule data
  ;; Very static. Might change if a game gets flexed
  ;; *******************************************************************************************************************

  #:use-module (oop goops)

  #:use-module (bad-cat utils)
  #:use-module (bad-cat nfldb)

  #:use-module (bad-cat nfldb cache)
  #:use-module (bad-cat nfldb espn)
  #:use-module (bad-cat nfldb team)
  #:use-module (bad-cat nfldb json)
  #:use-module (bad-cat nfldb team)
  #:use-module (bad-cat nfldb serialize)

  #:use-module (bad-cat nfldb cache league)

  #:export (standings-retrieve)
  #:export (standings-restore)
  #:export (standings-store)
  #:export (standings-update)

  #:export (get-standings)
  #:export (get-team-record)
)
(define standings-cache-root (format #f "~a/standings" nfldb-cache-root))

(define standings (make-parameter (make-hash-table)))

;;

(define (reset-cache standings-cache)
  (hash-clear! standings-cache)
  (map (lambda (c) (hash-set! standings-cache c (make-hash-table)))
       '(AFC NFC)))

(define (standings-retrieve)
  (reset-cache (standings))
  (espn-get-div-standings (standings)))

(define-method (espn-get-div-standings standings-cache)
  (let ( (json (espn-get-url (format #f "https://~a/core/nfl/standings?xhr=1" espn-host-cdn) port->json-obj)) )
    (map (lambda (c)
           (let ( (c-idx (conf->index c))
                  (conf-hash (hash-ref standings-cache c)) )
             (map (lambda (d)
                    (format #t "espn-get-div-standings: calling labmda on ~a ~a~%" c d)
                    (let ( (json-expr `(content standings groups ,c-idx groups ,(div->index d) standings entries)) )
                      (let ( (div-json (json-match json-expr json)) )
                        (hash-set! conf-hash d (process-division conf-hash div-json)))))
                  '(EAST NORTH SOUTH WEST))))
           '(AFC NFC))))

(define (get-stats-object stats)
  (let ( (rec (make-instance <nfl-team-record>)) )
    (define (proc-entry stat-json)
      (let ( (stat-name (string->symbol (string-downcase (json-ref shortDisplayName stat-json))))
             (stat-val (json-ref displayValue stat-json)) )
        (if (string? stat-val)
          (slot-set! rec stat-name (cons (string->number stat-val) stat-val))
          (slot-set! rec stat-name (cons stat-val (format #f "~3,'0d" stat-val))))))
    (map proc-entry stats)
    rec))

(define (process-division conf-hash div-json)
  (define (process-team-and-stats team-and-stats-obj)
    (let ( (nick (string->symbol (json-ref team.abbreviation team-and-stats-obj)))
           (stats (get-stats-object (json-ref stats team-and-stats-obj))) )
      (cons nick stats)))
  (format #t "process-division: calling on divison json: ~a~%" div-json)
  (map process-team-and-stats div-json))

(define (standings-store)
  (define (write-standing c d)
    (let ( (file (format #f "~a/~a/~a.scm" standings-cache-root c d)) )
      (with-output-to-file file (lambda () (write-constructor (get-standings c d) (current-output-port))))))
  (map (lambda (conf)
         (map (lambda (div) (write-standing conf div))
              '(EAST NORTH SOUTH WEST)))
       '(AFC NFC)))

(define (standings-restore)
  (define (read-standing c d)
    (let ( (file (format #f "~a/~a/~a.scm" standings-cache-root c d)) )
      (hash-set! (hash-ref (standings) c) d (with-input-from-file file (lambda () (nfldb-eval (read)))))))
  (reset-cache (standings))
  (map (lambda (conf)
         (map (lambda (div) (read-standing conf div))
              '(EAST NORTH SOUTH WEST)))
       '(AFC NFC)))

(define (standings-update)
  (standings-retrieve)
  (standings-store))

;; ---------------------------------------------------------------------------------------------------------------------
;; Public API
;; ---------------------------------------------------------------------------------------------------------------------

(define (get-standings conf div) (hash-ref (hash-ref (standings) conf) div))

(define (get-team-record team-nick)
  (define (find-team todo)
    (if (null? todo)
      #f
      (let ( (next (car todo)) )
        (if (eq? (car next) team-nick)
          (cdr next)
          (find-team (cdr todo))))))
  (let ( (team (get-team team-nick)) )
    (if team
      (let ( (div-standings (get-standings (team.conf team) (team.div team))) )
        (find-team div-standings))
      #f)))

  

