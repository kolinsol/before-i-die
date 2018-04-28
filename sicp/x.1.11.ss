; rec
(define (f n)
  (cond ((< n 3) n)
        (else
          (+
            (f (- n 1))
            (* 2 (f (- n 2)))
            (* 3 (f (- n 3)))))))

; iter
(define (g n)
  (define (iter a b c n)
    (cond ((= n 0) a)
          (else
            (iter b c (+ (* 3 a) (* 2 b) c) (- n 1)))))
  (iter 0 1 2 n))
