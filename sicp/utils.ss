(define (id x) x)

(define (inc x)
  (+ 1 x))

(define (dec x)
  (- x 1))

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (avg a b)
  (/ (+ a b) 2.0))

(define (negate x)
  (- x))

(define (true? v)
  (equal? v #t))

(define (false? v)
  (equal? v #f))

(define nil '())
(define true #t)
(define false #f)
(define rem remainder)
(define pos? positive?)
(define neg? negative?)

(define (^ x n)
  (define (iter acc x n)
    (cond ((= n 0) acc)
          ((even? n) (iter acc (square x) (halve n)))
          (else (iter (* acc x) x (- n 1)))))
  (iter 1 x n))

(define (gcd a b)
  (cond ((= b 0) a)
        (else (gcd b (rem a b)))))

(define (range a b)
  (cond ((> a b) '())
        (else (cons a (range (inc a) b)))))

(define (all f l)
  (cond ((null? l) #t)
        ((true? (f (car l))) (all f (cdr l)))
        (else #f)))

(define (any f l)
  (cond ((null? l) #f)
        ((true? (f (car l))) #t)
        (else (any f (cdr l)))))

(define (accumulate f a l)
  (cond ((null? l) a)
        (else
          (f (car l)
             (accumulate f a (cdr l))))))
