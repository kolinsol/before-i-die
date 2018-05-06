(load "utils.ss")
(load "x.2.56.ss") ; load exponentiation
(load "x.2.57.ss") ; load sum and product

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum
           (deriv (addend exp) var)
           (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product
             (multiplier exp)
             (deriv (multiplicand exp) var))
           (make-product
             (multiplicand exp)
             (deriv (multiplier exp) var))))
        ((exponentiation? exp)
         (make-product
           (make-product
             (exponent exp)
             (make-exponentiation
               (base exp)
               (make-sum (exponent exp) -1)))
           (deriv (base exp) var)))
        (else
          (error 'deriv "wrong expression" exp))))

(define variable? symbol?)

(define (same-variable? a b)
  (and (variable? a) (variable? b) (eq? a b)))

(define (=n a b)
  (and (number? a) (number? b) (= a b)))
