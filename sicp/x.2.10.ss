(define (div-interval x y)
  (cond ((= 0 (* (lower-bound y) (upper-bound y)))
         (error 'div-interval "division by zero interval" y))
        (else
          (mul-interval
            x
            (make-interval (/ 1.0 (upper-bound y))
                           (/ 1.0 (lower-bound y)))))))
