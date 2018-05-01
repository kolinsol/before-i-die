(load "utils.ss")

(define (mul a b)
  (define (iter acc-p acc-m n)
    (cond ((= n 1) (+ acc-m acc-p))
          ((even? n) (iter acc-p (double acc-m) (halve n)))
          (else (iter (+ acc-p acc-m) acc-m (- n 1)))))
  (iter 0 a b))
