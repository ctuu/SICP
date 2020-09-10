(load "ch1/1.37.scm")

(define (e k)
    (+ 2
       (cont-frac (lambda (i) 1.0)
                  (lambda (i) (if (= (remainder i 3) 2)
                                  (* 2 (/ (+ i 1) 3))
                                  1))
                  k)))

(e 1)

(e 2)

(e 5)

(e 10)

(e 100)