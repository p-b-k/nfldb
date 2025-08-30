(define-module (bad-cat nfldb json)

  ;; *******************************************************************************************************************
  ;; Define Request Objects for serializing to json
  ;; *******************************************************************************************************************

  #:use-module (oop goops)

  #:export (string->json-obj)
  #:export (port->json-obj)

  #:export (json-ref)
  #:export (json-keys)
)

;; *********************************************************************************************************************
;; Create methods to parse and access json values
;; *********************************************************************************************************************

(define (_1st a b) a)

(define (_2nd a b) b)

(define (parse-err reason fmt-string . values)
  (throw 'json-parse-error (make-stack #t) reason fmt-string values))

(define (ref-err reason fmt-string . values)
  (throw 'json-reference-error (make-stack #t) reason fmt-string values))

(define (json-keys ht)
  (if (hash-table? ht)
    (hash-map->list _1st ht)
    '()))

;; ---------------------------------------------------------------------------------------------------------------------
;; Create the json parser, parses into a string, boolean, number, list or map as appropriate
;; ---------------------------------------------------------------------------------------------------------------------

(define (read-json-value)
  ;; Consume any whitespace until done
  (define (consume-whitespace)
    (if (char-whitespace? (peek-char))
      (begin
        (read-char)
        (consume-whitespace))))

  ;; boolean
  (define (read-boolean)
    (define (get-sym sofar)
      (if (char-alphabetic? (peek-char))
        (get-sym (cons (read-char) sofar))
        (string->symbol (list->string (reverse sofar)))))
    (let ( (bool-value (get-sym '())) )
      (case bool-value
        ( (true) #t )
        ( (false) #f )
        ( else (parse-err 'invalid-boolean "Expected true or false, got ~s" bool-value) ))))

  ;; string
  (define (read-string)
    (define (read-string-opening)
      (let ( (next-char (read-char)) )
        (if (eq? next-char #\")
          (read-body '())
          (parse-err 'invalid-string-opening "Expecting quote (\"), got ~s" (peek-char)))))
    (define (read-body sofar)
      (let ( (next-char (read-char)) )
        (if (eq? next-char #\")
          (list->string (reverse sofar))
          (if (eq? next-char #\\)
            (read-escape sofar)
            (read-body (cons next-char sofar))))))
    (define (read-unicode sofar)
      (let ( (next (peek-char)) )
        (if (char-set-contains? char-set:hex-digit next)
          (read-unicode (cons (read-char) sofar))
          (integer->char (string->number (list->string (reverse sofar)))))))
    (define (read-escape sofar)
      (let ( (next-char (read-char)) )
        (case next-char
          ( (#\" #\\) (read-body (cons next-char sofar)) )
          ( (#\u) (read-body (cons (read-unicode (list #\x #\#)) sofar)) )
          ( else
            (parse-err 'invalid-escape-char "Expected either quote or backslash, got ~s" next-char) ))))

    (read-string-opening))

  ;; number
  (define (read-number)
    (define (parse-number s)
      (let ( (n (string->number s)) )
        (if n n (parse-err 'invalid-number "Unable to paser number strting: ~s~%" s))))
    (define (read-initial)
      (let ( (next (peek-char)) )
        (if (eof-object? next)
          (parse-err 'invalid-number "Expected a number, got and emtpy string instead")
          (cond
            ( (member next '(#\+ #\-))
              (read-int-digits (eq? (read-char) #\+) '()) )
            ( (eq? next #\.)
              (read-fract-digits #t '(#\. #\0)) )
            ( (char-numeric? next)
              (read-int-digits #t (list (read-char))) )
            ( #t (parse-number (list->string (reverse sofar))) )))))
    (define (read-int-digits positive? sofar)
      (let ( (next (peek-char)) )
        (if (eof-object? next)
          (* (if positive? 1 -1) (parse-number (list->string (reverse sofar))))
          (cond
            ( (eq? next #\.)
              (read-fract-digits positive? (cons (read-char) sofar)) )
            ( (char-numeric? next)
              (read-int-digits positive? (cons (read-char) sofar)) )
            ( #t (parse-number (list->string (reverse sofar))) )))))
    (define (read-fract-digits positive? sofar)
      (let ( (next (peek-char)) )
        (if (eof-object? next)
          (* (if positive? 1 -1) (parse-number (list->string (reverse sofar))))
          (cond
            ( (eq? next #\.)
              (parse-err 'invalid-number "Only a single decimal point is allowed in a number"
                         (list->string (reverse (cons next sofar)))) )
            ( (char-numeric? next)
              (read-fract-digits positive? (cons (read-char) sofar)) )
            ( #t (* (if positive? 1 -1) (parse-number (list->string (reverse sofar)))) )))))
    (read-initial))

  ;; [ value, ... ]
  (define (read-list)
    (define (read-first-list-value)
      (consume-whitespace)
      (if (eq? (peek-char) #\]) ;; Empty list
        (begin
          (read-char) ;; Consume the character
          '())
        (let ( (next-value (read-json-value)) )
          (read-list-tail (cons next-value '())))))

    (define (read-list-tail sofar)
      (consume-whitespace)
      (let ( (next-char (read-char)) )
        (case next-char
          ( (#\]) 
            (reverse sofar) )
          ( (#\,)
            (consume-whitespace)
            (read-list-tail (cons (read-json-value) sofar)) )
          ( else (parse-err 'invalid-list-sep "Expected , or ], got ~a" next-char) ))))

      (let ( (next-char (read-char)) )
        (if (eq? next-char #\[)
          (read-first-list-value)
          (parse-err 'invalid-list-start "Expected [, got ~a" next-char))))

  ;; { name : value, ... }
  (define (read-map)
    (let ( (values (make-hash-table)) )
      (define (read-map-start)
        (consume-whitespace)
        (if (eq? (peek-char) #\})
          (begin
            (read-char)
            values)
          (read-map-pairs)))
      (define (read-map-pairs)
        (consume-whitespace)
        (let ( (entry-name (string->symbol (read-string))) )
          (if (hash-ref values entry-name)
            (parse-err 'duplicate-map-entry "Map entry for ~a already defined" entry-name))
          (consume-whitespace)
          (if (eq? (read-char) #\:)
            (begin
              (consume-whitespace)
              (let ( (entry-value (read-json-value)) )
                (hash-set! values entry-name entry-value)
                (consume-whitespace)
                (let ( (next-char (read-char)) )
                  (case next-char
                    ( (#\}) values )
                    ( (#\,) (read-map-pairs) )
                    ( else (parse-err 'invalid-map-char "Expected either , or }, but got ~a" next-char) ))))))))

      (consume-whitespace)
      (let ( (next-char (read-char)) )
        (if (eq? next-char #\{)
          (read-map-start)
          (parse-err 'invalid-map-start "Expected {, got ~~a" next-char)))))

  (let ( (next (peek-char)) )
    (let ( (value (cond
                    ( (char-whitespace? next)     (begin (read-char) (read-json-value)) )
                    ( (eq? next #\")              (read-string) )
                    ( (eq? next #\[)              (read-list) )
                    ( (eq? next #\{)              (read-map) )
                    ( (char-alphabetic? next)     (read-boolean) )
                    ( (char-numeric? next)        (read-number) )
                    ( (eq? next #\-)              (read-number) )
                    ( #t (parse-err 'undetermined-value
                                    "Unable to determins json value type from initial char: ~a" next) ))) )
      value)))

(define (string->json-obj instr) (with-input-from-string instr read-json-value))

(define (port->json-obj inport) (with-input-from-port inport read-json-value))

;; ---------------------------------------------------------------------------------------------------------------------
;; Reference the values in the json object with a list path
;; ---------------------------------------------------------------------------------------------------------------------

(define-method (json-path-ref ref-path json-obj)
  (if (null? ref-path)
    json-obj
    (ref-err 'atomic-has-no-fields "atomic json object (~a) cannot be further referenced by ~a" json-obj ref-path)))
             
(define-method (json-path-ref ref-path (json-obj <pair>))
  (if (null? ref-path)
    json-obj
    (let ( (next (car ref-path)) )
      (if (string=? next "*") ;; wildcard
        (map (lambda (item) (json-path-ref (cdr ref-path) item)) json-obj)
        (let ( (idx (string->number next)) )
          (json-path-ref (cdr ref-path) (list-ref json-obj idx)))))))

(define-method (json-path-ref ref-path (json-obj <hashtable>))
  (if (null? ref-path)
    json-obj
    (let ( (next-key (string->symbol (car ref-path)))
           (fields (hash-map->list _1st json-obj)) )
      (if (member next-key fields)
        (json-path-ref (cdr ref-path) (hash-ref json-obj next-key))
        (ref-err 'field-not-defined "The field ~a is not defined in the json hash (fields: ~a)" next-key fields)))))
             
;; ---------------------------------------------------------------------------------------------------------------------
;; Create a handy macro for unwrapping a symbol into a path spec
;; ---------------------------------------------------------------------------------------------------------------------

(define (parse-ref-path sym) (string-split (symbol->string sym) #\.))

(define-syntax json-ref
  (syntax-rules ()
    ( (json-ref ref-spec json-obj)
      (json-path-ref (parse-ref-path (quote ref-spec)) json-obj) )))


