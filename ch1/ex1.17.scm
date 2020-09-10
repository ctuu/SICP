(define (fast-multi b n)
  (fast-multi-iter b n 0))

(define (halve b) (/ b 2))
(define (double b) (* b 2))

(define (fast-multi-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (fast-multi-iter (double b) (halve n) a))
        (else (fast-multi-iter b (- n 1) (+ a b)))))

(fast-multi 3 9)
