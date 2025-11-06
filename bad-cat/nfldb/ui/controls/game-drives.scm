(define-module (bad-cat nfldb ui controls game-drives)

  ;; *******************************************************************************************************************
  ;; Define the function for drawing the game's drives
  ;; *******************************************************************************************************************

  #:use-module (oop goops)
  #:use-module (cairo)

  #:use-module (bad-cat nfldb game)
  #:use-module (bad-cat nfldb cache league)

  #:use-module (bad-cat nfldb ui parameters)

  #:export (make-game-drive-draw-func)
)

(define (make-game-drive-draw-func game result)

  ;; Define the function to return ...
  (define (draw drawing-area cr-ptr width height user-data)
    (format #t "Drawing Drives (width = ~a, height = ~a)~%" width height)
    (let ( (cr (cairo-pointer->context cr-ptr))
           (parts (get-parts (team-nick->id (game.home game)) (result.drives result) height)) )
      (define (draw-part top part-pair)
;       (format #t "Drawing from ~4a - ~8a : ~a~%" top (car part-pair) (cdr part-pair))
        (case (car part-pair)
          ( (home)
            (cairo-rectangle cr 0 top width (cdr part-pair))
            (cairo-set-source-rgb cr 1 0.5 0)
            (cairo-fill cr) )
          ( (away)
            (cairo-rectangle cr 0 top width (cdr part-pair))
            (cairo-set-source-rgb cr 0 0.5 1)
            (cairo-fill cr) )
          ( (half quarter)
            (cairo-rectangle cr 0 top width (cdr part-pair))
            (cairo-set-source-rgb cr 0.5 0.5 0.5)
            (cairo-fill cr) )))
      (define (draw-parts top todo)
;       (format #t "Called draw-parts~%")
        (if (not (null? todo))
          (let ( (next-part (car todo)) )
            (draw-part top next-part)
            (draw-parts (+ top (cdr next-part)) (cdr todo)))))
      (cairo-rectangle cr 0 0 width height)
      (cairo-set-source-rgb cr 0.5 1 0)
      (cairo-fill cr)
      (format #t "About to draw the parts~%")
      (draw-parts 0 parts)))

  ;; ... and now return it
  draw)

(define (get-parts home-team drives height)
  (format #t "get-parts: called with height = ~a~%" height)
  (let ( (total-game-time (calc-total-game-time drives)) )
    (format #t "get-parts: calc-total-game-time = ~a~%" calc-total-game-time)
    (define (next-drive qprev todo sofar)
      (if (null? todo)
        (reverse sofar)
        (let ( (drive (car todo)) )
;         (format #t "home? == (~s = ~s)?~%" (slot-ref drive 'team-id) home-team)
          (let ( (qstart (slot-ref drive 'qstart))
                 (qend   (slot-ref drive 'qend))
                 (home?  (eq? (slot-ref drive 'team-id) home-team)) )
            (cond
              ;;
              ;; The three most likely scenarios
              ;;

              ;; The drive starts and end in the same quarter as the previsous drive
              ( (eq? qprev qstart qend)
                (let ( (span (calc-span-pct (slot-ref drive 'time-clock))) )
;                 (format #t "case 1: span   = ~a~%" span)
                  (next-drive qend (cdr todo) (cons (cons (if home? 'home 'away) (* span height)) sofar))) )

              ;; The drive starts in the quarter following the previous quarter, and ends in the same quarter
              ( (eq? (1+ qprev) qstart qend)
                (let ( (span (calc-span-pct (slot-ref drive 'time-clock)))
                       (qpair (if (even? qprev)
                                (cons 'half (* height (/ (drive-break-2-width) total-game-time)))
                                (cons 'quarter (* height (/ (drive-break-4-width) total-game-time))))) )
;                 (format #t "case 2: span   = ~a~%" span)
;                 (format #t "case 2: time   = ~a~%" (cdr qpair))
                  (next-drive qend (cdr todo)
                              (append (list (cons (if home? 'home 'away) (* span height))
                                            qpair)))) )

              ;; The drive starts in the same quarter as the previous drive, but ends in the following quarter
              ( (eq? qprev qstart (1- qend))
                (let ( (span-1 (calc-span-pct-to-end (slot-ref drive 'start-clock)))
                       (span-2 (calc-span-pct-from-start (slot-ref drive 'end-clock)))
                       (qpair (if (even? qprev)
                                (cons 'half (* height (/ (drive-break-2-width) (* 60 60 ))))
                                (cons 'quarter (* height (/ (drive-break-4-width) total-game-time))))) )
;                 (format #t "case 3: span 1 = ~a~%" span-1)
;                 (format #t "case 3: span 2 = ~a~%" span-2)
;                 (format #t "case 3: time   = ~a~%" (cdr qpair))
                  (let ( (cons-1 (cons (if home? 'home 'away) (* span-1 height)))
                         (cons-2 (cons (if home? 'home 'away) (* span-2 height))) )
                    (next-drive qend (cdr todo) (append (list cons-2 qpair cons-1) sofar)))) )

              ;;
              ;; I guess something else is possible, but I'm just going to error until I have to deal with it
              ;;

              ( #t (throw 'unexpected-drive-span ('prev qprev) ('start qstart) ('end qend)) ))))))

    (next-drive 1 drives (list (cons 'start 0)))))

(define (calc-total-game-time drives)
  (define (calc-max-quarter quarter todo)
    (if (null? todo)
      quarter
      (let ( (drive (car todo)) )
        (if (> quarter (slot-ref drive 'qend))
          (calc-max-quarter quarter (cdr todo))
          (calc-max-quarter (slot-ref drive 'qend) (cdr todo))))))
  (let ( (num-quarters (calc-max-quarter 0 drives)) )
    (if (eq? num-quarters 4)
      (cons (+ 60 (drive-break-2-mins) (* 2 (drive-break-4-mins))) 0)
      (if (num-quarters 5)
        (cons (+ 60 (* 2 (+ (drive-break-2-mins) (drive-break-4-mins)))) 0)
        (throw 'wrong-numer-of-quarters-not-4-or-5 num-quarters)))))

(define (calc-total-play-height height drives)
  (define (calc-max-quarter quarter todo)
    (if (null? todo)
      quarter
      (let ( (drive (car todo)) )
        (if (> quarter (slot-ref drive 'qend))
          (calc-max-quarter quarter (cdr todo))
          (calc-max-quarter (slot-ref drive 'qend) (cdr todo))))))
  (format #t "!!!!!!! DEPRECATED calc-total-play-height called~%")
  (let ( (num-quarters (calc-max-quarter 0 drives)) )
    (if (eq? num-quarters 4)
      (- height (+ (* 2 (drive-break-4-width)) (drive-break-2-width)))
      (if (num-quarters 5)
        (- height (+ (* 2 (drive-break-4-width)) (* 2 (drive-break-2-width))))
        (throw 'wrong-numer-of-quarters-not-4-or-5 num-quarters)))))

(define (calc-span-pct time-pair)
  (/ (+ (* 60 (car time-pair)) (cdr time-pair)) (* 60 60)))

(define (calc-span-pct-to-end time-pair) (calc-span-pct time-pair))

(define (calc-span-pct-from-start time-pair)
  (let ( (elapsed-time (- (* 60 (- 15 (car time-pair))) (- 60 (cdr time-pair)))) )
    (/ elapsed-time (* 60 60))))

