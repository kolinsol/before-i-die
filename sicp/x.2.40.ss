(load "utils.ss")

(define (unique-pairs n)
  (flatmap (lambda (x)
             (map (lambda (y) (list x y))
                  (range 1 (dec x))))
           (range 2 n)))
