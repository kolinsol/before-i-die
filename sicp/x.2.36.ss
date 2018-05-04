(load "utils.ss")

(define (accumulate-n f a t)
  (cond ((any null? t) '())
        (else
          (cons (accumulate f a (map car t))
                (accumulate-n f a (map cdr t))))))
