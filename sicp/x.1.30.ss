(load "utils.ss")

(define (sum a b term next)
  (define (iter acc x)
    (cond ((> x b) acc)
          (else (iter (+ acc (term x)) (next x)))))
  (iter 0 a))
