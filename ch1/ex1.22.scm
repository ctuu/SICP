(load "ch1/1.21.scm")

(define (prime? n)
 (= n (smallest-divisor n)))


(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (real-time-clock)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (real-time-clock) start-time))))
    
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))


(define (nextodd n)
 (if (= 0 (remainder n 2))
     (+ 1 n)
     (+ 2 n)))

(define (count-prime n count)
  (cond ((= count 0) (newline)
                     (display "end"))
        ((prime? n) (timed-prime-test n)
                    (count-prime (nextodd n) (- count 1)))
        (else (count-prime (nextodd n) count))))


(define (search-for-primes n)
  (count-prime n 3))

; (search-for-primes 1000)
; (search-for-primes 10000)
; (search-for-primes 100000)
; (search-for-primes 1000000)
; (search-for-primes 10000000)
; (search-for-primes 100000000)
; (search-for-primes 1000000000)
; (search-for-primes 10000000000)
