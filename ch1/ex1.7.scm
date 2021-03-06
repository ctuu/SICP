(load "ch1/1.6.scm")

(define (good-enough? old-guess new-guess)
    (> 0.01
       (/ (abs (- old-guess new-guess))
          old-guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
      (improve guess x)
      (sqrt-iter (improve guess x)
                 x)))


(sqrt 0.00009)

(sqrt 900000000000000000000000000000000000000000000000000000000000000000000000000000000000)