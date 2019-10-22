(define (cons x y)
  (* (expt 2 x)
     (expt 3 y)))
    
(cons 3 2)

(define (car z)
  (if (=  0 (remainder z 2))
      (+ 1 (car (/ z 2)))
      0))

(define (cdr z)
  (if (= 0 (remainder z 3))
      (+ 1 (cdr (/ z 3)))
      0))

(car (cons 3 2))
(cdr (cons 3 2))

