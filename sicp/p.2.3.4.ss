(load "x.2.68.ss") ; load encode function
(load "p.2.3.3.ss") ; load set functions

(define (append* a b)
  (let ((a-l (if (list? a) a (list a)))
        (b-l (if (list? b) b (list b))))
    (append a-l b-l)))
(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? exp)
  (eq? (car exp) 'leaf))

(define symbol-leaf cadr)
(define weight-leaf caddr)

(define (make-code-tree left right)
  (list left
        right
        (append* (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define left-branch car)
(define right-branch cadr)
(define (symbols tree)
  (cond ((leaf? tree)
         (symbol-leaf tree))
        (else (caddr tree))))
(define (weight tree)
  (cond ((leaf? tree)
         (weight-leaf tree))
        (else (cadddr tree))))

(define (choose-branch bit tree)
  (cond ((= bit 0) (left-branch tree))
        ((= bit 1) (right-branch tree))
        (else (error 'choose-branch "invalid bit" bit))))

(define (decode bits tree)
  (define (decode-branch bits branch)
    (cond ((null? bits) '())
          (else
            (let ((next-branch (choose-branch (car bits) branch)))
              (cond ((leaf? next-branch)
                     (cons (symbol-leaf next-branch)
                           (decode-branch (cdr bits) tree)))
                    (else (decode-branch (cdr bits) next-branch)))))))
  (decode-branch bits tree))

(define weight-elem cadr)

(define (adjoin-weighted-set x s)
  (cond ((null? s) (list x))
        ((< (weight x) (weight (car s)))
         (cons x s))
        (else (cons (car s) (adjoin-weighted-set x (cdr s))))))

(define (make-leaf-set pairs)
  (cond ((null? pairs) '())
        (else (let ((pair (car pairs)))
          (adjoin-weighted-set
            (make-leaf (car pair) (cadr pair))
            (make-leaf-set (cdr pairs)))))))
