; recurcive process
(define (fact-rec n)
  (if (= n 1)
    1
    (* n (fact-rec (- n 1)))))

; iterative process
(define (fact n)
  (define (iter acc count)
    (if (> count n)
      acc
      (iter (* acc count) (+ count 1))))
  (iter 1 1))
