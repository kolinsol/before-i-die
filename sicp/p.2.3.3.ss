(load "x.2.59.ss") ; load union-set
(load "x.2.61.ss") ; load adjoin-ord-set
(load "x.2.62.ss") ; load union-ord-set

(define (element-of-set? x s)
  (cond ((null? s) #f)
        ((equal? x (car s)) #t)
        (else (element-of-set? x (cdr s)))))

(define (adjoin-set x s)
  (cond ((element-of-set? x s) s)
        (else (cons x s))))

(define (intersection-set s1 s2)
  (cond ((null? s1) '())
        ((element-of-set? (car s1) s2)
         (cons (car s1)
               (intersection-set (cdr s1) s2)))
        (else (intersection-set (cdr s1) s2))))

(define (element-of-ord-set? x s)
  (cond ((null? s) #f)
        ((< x (car s)) #f)
        (else (element-of-ord-set? x (cdr s)))))

(define (intersection-ord-set s1 s2)
  (cond ((or (null? s1) (null? s2)) '())
        (else
          (let ((x1 (car s1)) (x2 (car s2)))
            (cond ((= x1 x2)
                   (cons x1
                         (intersection-ord-set (cdr s1) (cdr s2))))
                  ((< x1 x2)
                   (intersection-ord-set (cdr s1) s2))
                  ((> x1 x2)
                   (intersection-ord-set s1 (cdr s2))))))))

(define entry cadr)
(define left-branch car)
(define right-branch caddr)
(define (make-tree left entry right)
  (list left entry right))

(define (element-of-tree-set? x s)
  (cond ((null? s) #f)
        ((= x (entry s)) #t)
        ((< x (entry s))
         (element-of-tree-set? x (left-branch s)))
        ((> x (entry s))
         (element-of-tree-set? x (right-branch s)))))

(define (adjoin-tree-set x s)
  (cond ((null? s)
         (make-tree '() x '()))
        ((= x (entry s)) s)
        ((< x (entry s))
         (make-tree
           (adjoin-tree-set x (left-branch s))
           (entry s)
           (right-branch s)))
        ((> x (entry s))
         (make-tree
           (left-branch s)
           (entry s)
           (adjoin-tree-set x (right-branch s))))))

(define (lookup k records)
  (cond ((null? records) #f)
        ((equal? k (key (car records)))
         (car records))
        (else (lookup k (cdr records)))))

(define key car)
