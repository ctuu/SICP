(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))
                

(define (check n)
  (check-iter 1 n))

(define (check-iter a n)
  (cond ((= a n) true)
        ((= a (expmod a n n)) (check-iter (+ a 1) n))
        (else false)))



(check 561)

(check 1105)

(check 1729)

(check 2465)

(check 2821)

(check 6601)