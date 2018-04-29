(load "utils.ss")

(define (exp-rec x n)
  (if (= n 0)
    1
    (* x (exp-rec x (- n 1)))))

(define (exp-iter x n)
  (define (iter acc c)
    (if (= c n)
      acc
      (iter (* acc x) (+ c 1))))
  (iter 1 0))

(define (fast-exp x n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-exp x (/ n 2))))
        (else (* x (fast-exp x (- n 1))))))
