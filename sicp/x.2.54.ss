(define (eql? l1 l2)
  (cond ((null? l1) (null? l2))
        ((null? l2) (null? l1))
        ((atom? (car l1))
         (and
           (atom? (car l2))
           (eq? (car l1) (car l2))
           (eql? (cdr l1) (cdr l2))))
        (else
          (and
            (list? (car l2))
            (eql? (car l1) (car l2))
            (eql? (cdr l1) (cdr l2))))))
