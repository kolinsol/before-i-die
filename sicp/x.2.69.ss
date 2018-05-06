(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge leaf-set)
  (cond ((<= (length leaf-set) 1) leaf-set)
        (else
          (successive-merge
            (adjoin-weighted-set
              (make-code-tree
                (car leaf-set)
                (cadr leaf-set))
              (cddr leaf-set))))))
