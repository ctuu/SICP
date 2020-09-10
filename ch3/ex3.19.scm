

(define (loop? x)
  (define (next x)
    (if (pair? x)
        (cdr x)
        '()))

  (define (iter a b)
    (cond ((or (null? a) (null? b))
           false)
          ((eq? a b)
           true)
          (else (iter (next a) (next (next b))))))
  (iter (next x) (next (next x))))

(loop? (list 1 2 3))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(loop? (make-cycle (list 'a 'b 'c)))