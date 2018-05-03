(define (map f l)
  (cond ((null? l) '())
        (else (cons (f (car l)) (map f (cdr l))))))

(define (filter p l)
  (cond ((null? l) '())
        ((p (car l)) (cons (car l) (filter p (cdr l))))
        (else (filter p (cdr l)))))

(define (accumulate f a l)
  (cond ((null? l) a)
        (else (f (car l) (accumulate f a (cdr l))) )))

(define (enum-interval a b)
  (cond ((> a b) '())
        (else (cons a (enum-interval (+ 1 a) b)))))

(define (enum-tree t)
  (cond ((null? t) '())
        ((atom? (car t)) (append (list (car t))
                                 (enum-tree (cdr t))))
        (else (append (enum-tree (car t))
                      (enum-tree (cdr t))))))
