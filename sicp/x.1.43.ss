(define (repeated f n)
  (cond ((= n 1) (lambda (x) (f x)))
        (else (lambda (x) (f ((repeated f (- n 1)) x))))))
