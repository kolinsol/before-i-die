; recursive process
(define (fib-rec n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib-rec (- n 1))
                 (fib-rec (- n 2))))))

; iterative process
(define (fib n)
  (define (iter a b count)
    (if (= count 0)
      a
      (iter b (+ a b) (- count 1))))
  (iter 0 1 n))
