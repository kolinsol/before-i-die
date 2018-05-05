(define (memq x l)
  (cond ((null? l) #f)
        ((equal? x (car l)) l)
        (else (memq x (cdr l)))))
