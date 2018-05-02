(define (last-pair l)
  (cond ((null? (cdr l)) l)
        (else (last-pair (cdr l)))))
