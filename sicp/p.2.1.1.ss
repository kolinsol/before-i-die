(load "utils.ss")

(define (make-rat a b)
  (let ((g (gcd a b)))
    (cons (/ a g) (/ b g))))

(define numer car)
(define denom cdr)

(define (add-rat a b)
  (make-rat (+ (* (numer a) (denom b))
               (* (numer b) (denom a)))
            (* (denom a) (denom b))))

(define (sub-rat a b)
  (make-rat (- (* (numer a) (denom b))
               (* (numer b) (denom a)))
            (* (denom a) (denom b))))

(define (mul-rat a b)
  (make-rat (* (numer a) (numer b))
            (* (denom a) (denom b))))

(define (div-rat a b)
  (make-rat (* (numer a) (denom b))
            (* (numer a) (denom b))))

(define (equal-rat? a b)
  (= (* (numer a) (denom b))
     (* (numer b) (denom a))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))
