(define (cbrt x)
  (cbrt-iter 1.0 x))

(define (cbrt-iter guess x)
  (if (good-anough? guess x)
    guess
    (cbrt-iter (improve guess x) x)))

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (good-anough? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (improve guess x)
  (/
    (+ 
      (* 2 guess)
      (/ x (square guess)))
    3))
