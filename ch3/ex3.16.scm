(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(define one (list 1))

(count-pairs (list 1 2 3))

(count-pairs (list one one))

(define three (cons one one))

(count-pairs (cons three three))


