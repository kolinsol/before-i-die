(define (square x)
  (* x x))

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (^ x n)
  (define (iter acc x n)
    (cond ((= n 0) acc)
          ((even? n) (iter acc (square x) (halve n)))
          (else (iter (* acc x) x (- n 1)))))
  (iter 1 x n))

(define rem remainder)
