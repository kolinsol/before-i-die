(define (make-center-percent c p)
  (make-interval
    (- c (* c (/ p 100.0)))
    (+ c (* c (/ p 100.0)))))

(define (percent i)
  (* (/ (width i) (center i)) 100.0))
