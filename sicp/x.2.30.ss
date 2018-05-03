(load "utils.ss")

(define (square-tree t)
  (cond ((null? t) '())
        ((atom? (car t))
         (cons (square (car t)) (square-tree (cdr t))))
        (else (cons (square-tree (car t))
                    (square-tree (cdr t))))))
