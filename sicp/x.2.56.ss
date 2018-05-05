(load "utils.ss")

(define (make-exponentiation x n)
  (cond ((=n n 0) 1)
        ((=n n 1) x)
        ((and (number? x) (number? n)) (^ x n))
        (else (list '^ x n))))

(define (exponentiation? exp)
  (and (list? exp) (eq? (car exp) '^)))

(define base cadr)
(define exponent caddr)
