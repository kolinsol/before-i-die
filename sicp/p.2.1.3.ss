(define (cons x y)
  (define (dispatch n)
    (cond ((= n 0) x)
          ((= n 1) y)
          (else error 'dispatch "wrong input" n)))
  dispatch)

(define (car f)
  (f 0))

(define (cdr f)
  (f 1))
