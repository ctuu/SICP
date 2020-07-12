(load "ch3/3.54.scm")

(define (partial-sums s)
  (cons-stream (stream-car s)
               (add-streams (partial-sums s)
                            (stream-cdr s))))

(stream-ref (stream-map show (partial-sums integers)) 10)



