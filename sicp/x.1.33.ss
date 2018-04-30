(define (filt-acc-rec a b comb null pred term next)
  (cond ((> a b) null)
        ((pred a)
         (comb (term a)
               (filt-acc-rec (next a) b
                             comb null pred term next)))
        (else (filt-acc-rec (next a) b
                             comb null pred term next))))

(define (filt-acc-iter a b comb null pred term next)
  (define (iter acc x)
    (cond ((> x b) acc)
          ((pred x) (iter (comb acc (term x))
                          (next x)))
          (else (iter acc (next x)))))
  (iter null a))
