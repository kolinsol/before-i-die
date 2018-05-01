(define (cons x y)
  (lambda (f) (f x y)))

(define (car a b) a)

(define (cdr a b) b)
