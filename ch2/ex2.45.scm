(define (split operate1 operate2)
  (define (split-operate painter n)
    (if (= n 0)
        painter
        (let ((smaller (split-operate painter (- n 1))))
          (operate1 painter (operate2 smaller smaller)))))
  split-operate)


(define right-split (split beside below))

(define up-split (split below beside))