(load "ch1/1.20.scm")
(load "ch1/1.22.scm")

(define (filtered-accumulate combiner filter null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) 
              (if (filter a)
                  (combiner result (term a))
                  result))))
  (iter a null-value))


(define (sum-of-prime a b)
  (define (combiner x y) (+ x y))
  (define (filter x) (prime? x))
  (define (term x) x)
  (define (next x) (+ x 1))
  (filtered-accumulate combiner filter 0 term a next b))


(sum-of-prime 2 10)
; 2 3 5 7 

(define (product-of-coprime n)
  (define (combiner x y) (* x y))
  (define (filter x) (= 1 (gcd x n)))
  (define (term x) x)
  (define (next x) (+ x 1))
  (filtered-accumulate combiner filter 1 term 1 next (- n 1)))

(product-of-coprime 10)
