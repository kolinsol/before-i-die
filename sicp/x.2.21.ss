(load "utils.ss")

(define (square-list l)
  (cond ((null? l) '())
        (else (cons (square (car l))
                    (square-list (cdr l))))))

(define (map-square-list l)
  (map square l))
