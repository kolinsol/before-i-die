(define (pascal n)
  (cond ((= n 1) '(1))
        ((= n 2) '((1 1) (1)))
        (else
          (cons
            (surround-by-ones (next-row (car (pascal (- n 1)))))
            (pascal (- n 1))))))

(define (next-row prev-row)
  (cond ((<= (length prev-row) 1) '())
        (else
          (cons
            (+ (car prev-row) (cadr prev-row))
            (next-row (cdr prev-row))))))

(define (surround-by-ones l)
  (cons 1 (append l '(1))))

; TODO: try to implement this as an iterative process
; TODO: try to add formatting
