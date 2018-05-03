(load "p.2.2.3.ss")

(define (map p sequence)
  (accumulate
    (lambda (x y)
      (append y (list (p x))))
    '() 
    sequence))

(define (append seq1 seq2)
  (accumulate
    cons seq2 (reverse seq1)))

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))
