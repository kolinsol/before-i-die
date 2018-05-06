(define (element-of-set? x s)
  (cond ((null? s) #f)
        ((equal? x (car s)) #t)
        (else (element-of-set? x (cdr s)))))

(define (adjoin-set x s)
  (cons x s))

(define (union-set s1 s2)
  (append s1 s2))

(define (intersection-set s1 s2)
  (define (intersection-side xs ys)
    (cond ((null? xs) '())
          ((element-of-set? (car xs) ys)
           (cons (car xs)
                 (intersection-side (cdr xs) ys)))
          (else
            (intersection-side (cdr xs) ys))))
  (append (intersection-side s1 s2)
          (intersection-side s2 s1)))
