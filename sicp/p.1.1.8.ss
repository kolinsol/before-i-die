(define (sqrt x)
  (define (sqrt-iter guess)
    (if (good-anough? guess)
      guess
      (sqrt-iter (improve guess))))
  (define (good-anough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (sqrt-iter 1.0))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))
