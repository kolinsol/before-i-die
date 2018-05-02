(define (reverse l)
  (cond ((null? l) '())
        (else (append (reverse (cdr l)) (list (car l))))))
