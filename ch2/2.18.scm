(define (reverse items)
  (define (reverse-iter items cur)
    (if (null? items)
        cur
        (reverse-iter (cdr items) (cons (car items) cur))))
  (reverse-iter items ()))

(reverse (list 1 4 9 16 25))