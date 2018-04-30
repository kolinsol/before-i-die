(define (id x) x)

(define (inc x)
  (+ 1 x))

(define (dec x)
  (- x 1))

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (avg a b)
  (/ (+ a b) 2))

(define rem remainder)
(define pos? positive?)
(define neg? negative?)

(define (^ x n)
  (define (iter acc x n)
    (cond ((= n 0) acc)
          ((even? n) (iter acc (square x) (halve n)))
          (else (iter (* acc x) x (- n 1)))))
  (iter 1 x n))

