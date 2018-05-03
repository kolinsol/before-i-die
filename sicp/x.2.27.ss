(define (deep-reverse t)
  (cond ((null? t) '())
        (else
          (cond ((list? (car t))
                 (append (deep-reverse (cdr t)) (list (deep-reverse (car t)))))
                (else
                 (append (deep-reverse (cdr t)) (list (car t))))))))
