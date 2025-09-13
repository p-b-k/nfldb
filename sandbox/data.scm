;; *********************************************************************************************************************
;; Test new caching system
;; *********************************************************************************************************************

(use-modules (oop goops))

(use-modules (bad-cat nfldb cache))

(use-modules (bad-cat nfldb cache league))
(use-modules (bad-cat nfldb cache schedule))

(use-modules (bad-cat utils))

(define league-cache ((@@ (bad-cat nfldb cache league) league)))
(define schedule-cache ((@@ (bad-cat nfldb cache schedule) schedule)))

(league-restore)
(schedule-restore)

;; =====================================================================================================================
;; Keeping this around as a model for getting the division data from espn

(define-method (espn-get-div-standings (c-idx <integer>) (d-idx <integer>))
  (let ( (json (espn-get-url "https://cdn.espn.com/core/nfl/standings?xhr=1" port->json-obj)) )
    (let ( (standings (json-match `(content standings groups ,c-idx groups ,d-idx standings entries) json)) )
      (map (lambda (x)
             (let ( (rec (make-instance <nfl-team-record>)) )
               (define (proc-entry stat-json)
                 (let ( (stat-name (string->symbol (string-downcase (json-ref shortDisplayName stat-json))))
                        (stat-val (json-ref displayValue stat-json)) )
                   (if (string? stat-val)
                     (slot-set! rec stat-name (cons (string->number stat-val) stat-val))
                     (slot-set! rec stat-name (cons stat-val (format #f "~3,'0d" stat-val))))))
               (map proc-entry (json-ref stats x))
               (cons (string->symbol (json-ref team.abbreviation x)) rec)))
           standings))))

