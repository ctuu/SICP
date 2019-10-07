(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (new-expmod base exp m)
  (remainder (fast-expt base exp) m))


(define (new-expmod base exp m) ;取余太晚
;   (remainder (fast-expt base exp)
  (remainder (cond ((= exp 0) 1)
                   ((even? exp) (square (fast-expt base (/ exp 2))))
                   (else (* base (fast-expt (- exp 1)))))
             m))


(expmod 3 7 7)