(define (same-parity g . w)
  (define x (remainder g 2))
  (define (iter w)
    (cond ((null? w) ())
          ((= x (remainder (car w) 2)) (cons (car w) (iter (cdr w))))
          (else (iter (cdr w)))))
  (cons g (iter w)))

(same-parity 1 2 3 4 5 6 7)

(same-parity 2 3 4 5 6 7)