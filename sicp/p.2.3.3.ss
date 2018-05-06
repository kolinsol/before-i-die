(load "x.2.59.ss") ; load union-set

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

