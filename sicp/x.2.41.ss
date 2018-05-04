(load "x.2.40.ss") ; import unique-pairs

(define (unique-ordered-triples n)
  (flatmap (lambda (x)
             (map (lambda (y) (cons y x))
                  (range (inc (car x)) n)))
           (unique-pairs n)))
