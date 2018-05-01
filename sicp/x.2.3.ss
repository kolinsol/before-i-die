(load "x.2.2.ss") ; import point functions

(define make-rect cons)
(define left-point car)
(define right-point cdr)

(define (width rect)
  (abs 
    (- (x-point (left-point rect))
       (x-point (right-point rect)))))

(define (height rect)
  (abs 
    (- (y-point (left-point rect))
       (y-point (right-point rect)))))

(define (perimeter rect)
  (* 2 (+ (height rect) (width rect))))

(define (square rect)
  (* (height rect) (width rect)))
