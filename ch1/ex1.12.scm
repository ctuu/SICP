(define (pascal i n)
  (cond ((= i 0) 0)
        ((= i n) 1)
        (else (+ (pascal i (- n 1))
                 (pascal (- i 1) (- n 1))))))


(pascal 1 5)
(pascal 2 5)
(pascal 3 5)
(pascal 4 5)
(pascal 1 5)