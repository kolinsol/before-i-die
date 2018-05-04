(load "utils.ss")
(load "x.2.36.ss") ; import accumulate-n

(define (dot-product v1 v2)
  (accumulate + 0 (map * v1 v2)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))

(define (transpose m)
  (accumulate-n cons '() m))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x)
           (map (lambda (y)
                  (dot-product y x)) cols)) m)))
