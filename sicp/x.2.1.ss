(load "utils.ss")


(define (make-rat a b)
  (define (equal-sign? a b)
    (cond ((and (neg? a) (neg? b)) #t)
          ((and (pos? a) (pos? b)) #t)
          (else #f)))
  (let ((g (gcd a b)))
    (cond ((equal-sign? a b)
           (cons (abs (/ a g)) (abs (/ b g))))
          (else (cons (negate (abs (/ a g))) (abs (/ b g)))))))
