(define (same-parity x . l)
  (cond ((even? x) (filter even? l))
        (else (filter odd? l))))
