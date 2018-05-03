(define (count-leaves t)
  (accumulate
    +
    0
    (map
      (lambda (x)
        (cond ((list? x) (count-leaves x))
              (else 1)))
      t)))
