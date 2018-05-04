(define (foldr f a l)
  (cond ((null? l) a)
        (else (f (car l) (foldr f a (cdr l))))))

(define (foldl f a l)
  (cond ((null? l) a)
        (else (foldl f (f a (car l)) (cdr l)))))

(define (rev-l l)
  (foldl (lambda (x y) (cons y x)) '() l))
(define (rev-r l)
  (foldr (lambda (x y) (append y (list x))) '() l))
