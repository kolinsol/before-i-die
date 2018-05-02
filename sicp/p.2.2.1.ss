(define (list-ref list n)
  (cond ((= n 0) (car list))
        (else (list-ref (cdr list) (- n 1)))))

(define (length-rec list)
  (cond ((null? list) 0)
        (else (+ 1 (length-rec (cdr list))))))

(define (length-iter list)
  (define (iter l n)
    (cond ((null? l) n)
          (else (iter (cdr l) (+ 1 n)))))
  (iter list 0))

(define (append l1 l2)
  (cond ((null? l1) l2)
        (else (cons (car l1) (append (cdr l1) l2)))))
