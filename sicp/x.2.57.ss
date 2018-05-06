(define (make-sum a b)
  (cond ((=n a 0) b)
        ((=n b 0) a)
        ((and (number? a) (number? b)) (+ a b))
        (else (list '+ a b))))

(define (make-product a b)
  (cond ((or (=n a 0) (=n b 0)) 0)
        ((=n a 1) b)
        ((=n b 1) a)
        ((and (number? a) (number? b)) (* a b))
        (else (list '* a b))))

(define (sum? x) (and (list? x) (eq? (car x) '+)))
(define (product? x) (and (list? x) (eq? (car x) '*)))

(define addend cadr)
(define (augend exp)
  (accumulate make-sum 0 (cddr exp)))

(define multiplier cadr)
(define (multiplicand exp)
  (accumulate make-product 1 (cddr exp)))
