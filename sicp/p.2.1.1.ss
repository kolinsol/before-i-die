(load "utils.ss")
(load "x.2.1.ss") ; import make-rat

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
