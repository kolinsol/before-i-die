(load "utils.ss")

(define make-segmaent cons)
(define start-segment car)
(define end-segment cdr)

(define make-point cons)
(define x-point car)
(define y-point cdr)

(define (mid-point s)
  (make-point
    (avg (x-point (start-segment s))
         (x-point (end-segment s)))
    (avg (y-point (start-segment s))
         (y-point (end-segment s)))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))
