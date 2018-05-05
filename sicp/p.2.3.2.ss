(load "x.2.56.ss")

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
               (- (exponent exp) 1)))
           (deriv (base exp) var)))
        (else
          (error 'deriv "wrong expression" exp))))

(define variable? symbol?)

(define (same-variable? a b)
  (and (variable? a) (variable? b) (eq? a b)))

(define (make-sum a b)
  (cond ((=n a 0) b)
        ((=n b 0) a)
        ((and (number? a) (number? b)) (+ a b))
        (else (list '+ a b))))

(define (make-product a b)
  (cond ((or (=n a 0) (=n b 0)) 0)
        ((=n a 1) b)
        ((=n b 1) a)
        ((and (number? a) (number? b)) (* a b))
        (else (list '* a b))))

(define (sum? x) (and (list? x) (eq? (car x) '+)))
(define (product? x) (and (list? x) (eq? (car x) '*)))

(define addend cadr)
(define augend caddr)

(define multiplier cadr)
(define multiplicand caddr)

(define (=n a b)
  (and (number? a) (number? b) (= a b)))
