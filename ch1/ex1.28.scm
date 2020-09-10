(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((trival? base m) 0)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (trival? a n)
  (and (not (= a 1))
       (not (= a (- n 1)))
       (= 1 (remainder (square a) n))))
        

(define (miller-test n)
  (define (try-it a)
   (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))


(define (check n)
  (check-iter 1 n))

(define (check-iter a n)
  (cond ((= a n) true)
        ((= 1 (expmod a (- n 1) n)) (check-iter (+ a 1) n))
        (else false)))

(miller-test 7)

(miller-test 11)

(miller-test 561)

(check 13)

(check 561)

(check 1105)

(check 1729)

(check 2465)

(check 2821)

(check 6601)