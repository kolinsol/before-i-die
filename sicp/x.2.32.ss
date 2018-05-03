(define (subsets l)
  (cond ((null? l) '(()))
        (else
          (let ((rest (subsets (cdr l))))
            (append rest (map (lambda (x) (cons (car l) x)) rest))))))
