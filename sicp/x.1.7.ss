(define (sqrt x)
  (sqrt-iter 1.0 2.0 3.0 x))

(define (sqrt-iter guess p-diff n-diff x)
  (if (good-anough? p-diff n-diff)
    guess
    (sqrt-iter
      (improve guess x)
      n-diff
      (- guess (improve guess x))
      x)))

(define (square x)
  (* x x))

(define (good-anough? p-diff n-diff)
  (< (abs (- p-diff n-diff)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

