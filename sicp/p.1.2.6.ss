(load "utils.ss")

(define (smallest-sivisor n)
  (define (find-divisor test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor) test-divisor)
          (else (find-divisor (+ test-divisor 1)))))
  (define (divides? x)
    (= (rem n x) 0))
  (find-divisor 2))

(define (prime? n)
  (= (smallest-sivisor n) n))

(define (fermat-check a n)
  (= (rem (^ a n) n) a))

(define (fermat-test n)
  (define (try a)
    (fermat-check a n))
  (try (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))
