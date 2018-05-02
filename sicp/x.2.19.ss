(define (change amount)
  (define us-coins '(50 25 10 5 1))
  (define (cc amount coins)
    (cond ((= amount 0) 1)
          ((or (< amount 0) (null? coins)) 0)
          (else
            (+ (cc amount (cdr coins))
               (cc (- amount (car coins)) coins)))))
  (cc amount us-coins))
