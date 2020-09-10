(load "ch3/3.51.scm")

(define (expand num den radix)
  (cons-stream
    (quotient (* num radix) den)
    (expand (remainder (* num radix) den) den radix)))


(stream-ref (stream-map show (expand 1 7 10)) 10)

(stream-ref (stream-map show (expand 3 8 10)) 10)