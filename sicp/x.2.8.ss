(define (sub-interval x y)
  (add-interval
    x
    (make-interval (- (lower-bound y)) (- (upper-bound y)))))
