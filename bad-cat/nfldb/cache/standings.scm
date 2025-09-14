(define-module (bad-cat nfldb cache standings)

  ;; *******************************************************************************************************************
  ;; Cache for Schedule data
  ;; Very static. Might change if a game gets flexed
  ;; *******************************************************************************************************************

  #:use-module (oop goops)

  #:use-module (bad-cat utils)

  #:use-module (bad-cat nfldb cache)
  #:use-module (bad-cat nfldb espn)
  #:use-module (bad-cat nfldb team)
  #:use-module (bad-cat nfldb json)
  #:use-module (bad-cat nfldb team)
  #:use-module (bad-cat nfldb cache league)

  #:export (standings-retrieve)
  #:export (standings-restore)
  #:export (standings-store)

  #:export (get-standings)
)

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
  (let ( (json (espn-get-url "https://cdn.espn.com/core/nfl/standings?xhr=1" port->json-obj)) )
    (map (lambda (c)
           (let ( (c-idx (conf->index c))
                  (conf-hash (hash-ref standings-cache c)) )
             (map (lambda (d)
                    (let ( (json-expr `(content standings groups ,c-idx groups ,(div->index d) standings entries)) )
                      (let ( (div-json (json-match json-expr json)) )
                        (hash-set! conf-hash d (process-division conf-hash div-json)))))
                  '(EAST NORTH SOUTH WEST))))
           '(AFC NFC))))

(define (process-division conf-hash div-json)
  (let ( (rec (make-instance <nfl-team-record>)) )
    (define (proc-entry stat-json)
      (format #t "process-division.proc-entry: stat-json = ~a ~a~%" stat-json (hash-ref stat-json 'stats))
      (let ( (stat-name (string->symbol (string-downcase (json-ref shortDisplayName stat-json))))
             (stat-val (json-ref displayValue stat-json)) )
        (if (string? stat-val)
          (slot-set! rec stat-name (cons (string->number stat-val) stat-val))
          (slot-set! rec stat-name (cons stat-val (format #f "~3,'0d" stat-val))))))
    (map (lambda (x)
           (map proc-entry (json-ref stats x)))
         div-json)
    rec))

(define (get-standings conf div) (hash-ref (hash-ref (standings) conf) div))
