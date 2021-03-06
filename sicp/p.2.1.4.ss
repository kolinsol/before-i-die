(load "x.2.7.ss") ; import interval constructor functions
(load "x.2.8.ss") ; import sub-interval
(load "x.2.10.ss") ; import modified div-interval
(load "x.2.11.ss") ; import center-width functions
(load "x.2.12.ss") ; import center-percent functions

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))
