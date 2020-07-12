(define (inner x memo-list)
  (if (and (pair? x) (false? (memq x memo-list)))
      (inner (car x)
             (inner (cdr x)
                    (cons x memo-list)))
      memo-list))

(define (count-pairs x)
  (length (inner x '())))

(define one (list 1))

(count-pairs (list 1 2 3))

(count-pairs (list one one))

(define three (cons one one))

(count-pairs (cons three three))


