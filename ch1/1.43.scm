(load "ch1/1.42.scm")

(define (repeated f n)
  (if (= 1 n)
      f
      (compose f (repeated f (- n 1)))))

((repeated square 2) 5)