(load "utils.ss")

(define (cons x y)
  (* (^ 2 x) (^ 3 y)))

(define (car p)
  (define (iter acc x)
    (cond ((= (rem x 2) 0) (iter (+ 1 acc) (/ x 2)))
          (else acc)))
  (iter 0 p))

(define (cdr p)
  (define (iter acc x)
    (cond ((= (rem x 3) 0) (iter (+ 1 acc) (/ x 3)))
          (else acc)))
  (iter 0 p))
