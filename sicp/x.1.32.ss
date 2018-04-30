(define (acc-rec a b comb null term next)
  (cond ((> a b) null)
        (else
          (comb (term a)
                (acc-rec (next a) b comb null term next)))))

(define (acc-iter a b comb null term next)
  (define (iter acc x)
    (cond ((> x b) acc)
          (else (iter (comb acc (term x))
                      (next x)))))
  (iter null a))
