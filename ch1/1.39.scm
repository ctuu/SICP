(load "ch1/1.37.scm")

(define (tan-cf x k)
  (define (d i) (- (* i 2) 1))
  (define x2 (- (square x)))
  (define (n i) (if (= i 1)
                     x
                     x2))
  (exact->inexact (cont-frac n d k)))

(tan-cf 10 100)

(tan 10)