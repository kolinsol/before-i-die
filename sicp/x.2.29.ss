(define (make-mobile l r)
  (list l r))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (make-branch length structure)
  (list length structure))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

(define (total-weight mobile)
  (cond ((number? mobile) mobile)
        (else
          (+ (total-weight (branch-structure (left-branch mobile)))
             (total-weight (branch-structure (right-branch mobile)))))))

(define (balanced? mobile)
  (cond ((number? mobile) #t)
        (else
          (and
            (= (* (branch-length (left-branch mobile))
                  (total-weight (branch-structure (left-branch mobile))))
               (* (branch-length (right-branch mobile))
                  (total-weight (branch-structure (right-branch mobile)))))
            (balanced? (branch-structure (left-branch mobile)))
            (balanced? (branch-structure (right-branch mobile)))))))
