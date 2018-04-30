(load "utils.ss")

(define (sum-integers a b)
  (cond ((> a b) 0)
        (else (+ a (sum-integers (+ a 1) b)))))

(define (sum-cubes a b)
  (cond ((> a b) 0)
        (else (+ (cube a) (sum-cubes (+ a 1) b)))))

(define (pi-sum a b)
  (cond ((> a b) 0)
        (else (+ (/ 1.0 (* a (+ a 2)))
                 (pi-sum (+ a 4) b)))))

(define (sum a b term next)
  (cond ((> a b) 0)
        (else (+ (term a) (sum (next a) b term next)))))
