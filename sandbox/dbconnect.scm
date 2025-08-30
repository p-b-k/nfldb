(use-modules (dbi dbi))

(define nfldb (dbi-open "mysql" "pbk:secret:nfl:tcp:localhost:3306"))
; (define nfldb (dbi-open "mysql" "pbk:secret:nfl:socket:/tmp/mysql.sock"))

(define query-season "SELECT * FROM SEASON")

(dbi-query nfldb "select * from pippo")
    (display nfldb)(newline)
    (set! ret (dbi-get_row nfldb))
    (while (not (equal? ret #f))
	   (display ret)(newline)
	   (set! ret (dbi-get_row nfldb))
	   )
    (display ret)(newline)

))
