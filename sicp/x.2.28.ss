(define (fringe t)
  (cond ((null? t) '())
        ((atom? (car t))
         (append (list (car t)) (fringe (cdr t))))
        (else
         (append (fringe (car t)) (fringe (cdr t))))))
