(load "utils.ss")

(define (gcd a b)
  (cond ((= b 0) a)
        (else (gcd b (rem a b)))))