(define (loop? x)
  (let ((memo '()))
    (define (iter x)
      (cond ((not (pair? x))
             false)
            ((memq x memo)
             true)
            (else (begin (set! memo (cons x memo))
                         (iter (cdr x))))))
    (iter x)))



(loop? (list 1 2 3))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(loop? (make-cycle (list 'a 'b 'c)))