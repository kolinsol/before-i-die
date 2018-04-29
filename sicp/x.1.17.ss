(load "utils.ss")

; rec
(define (mul-rec a b)
  (cond ((= b 0) 0)
        (else (+ a (mul-rec a (- b 1))))))

; iter
(define (mul-iter a b)
  (define (iter acc-p acc-m n)
    (cond ((= n 1) (+ acc-m acc-p))
          ((even? n) (iter acc-p (double acc-m) (halve n)))
          (else (iter (+ acc-p acc-m) acc-m (- n 1)))))
  (iter 0 a b))
