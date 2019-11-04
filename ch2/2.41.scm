(load "ch2/2.40.scm")

(define (unique-tuples n)
  (flatmap (lambda (n)  (map (lambda (i) (cons n i)) 
                             (unique-pairs (- n 1))))
           (enumerate-interval 1 n)))

(unique-tuples 5)

(define (tuple-sum tuple)
  (accumulate + 0 tuple))

(define (make-tuples-sum n s)
  (filter (lambda (tuple) (= (tuple-sum tuple) s))
          (unique-tuples n)))

(make-tuples-sum 5 10)