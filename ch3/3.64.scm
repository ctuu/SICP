(load "ch1/1.6.scm")
(load "ch3/3.52.scm")

(define (sqrt-improve guess x)
  (average guess (/ x guess)))

(define (sqrt-stream x)
  (define guesses
    (cons-stream 1.0
                 (stream-map (lambda (guess)
                               (sqrt-improve guess x))
                             guesses)))
  guesses)

(define (stream-limit stream tolerance)
  (let ((n (stream-car stream))
        (n+1 (stream-car (stream-cdr stream))))
    (if (< (abs (- n n+1)) tolerance)
            n+1
            (stream-limit (stream-cdr stream) tolerance))
    ))


(define (sqrt x tolerance)
  (stream-limit (sqrt-stream x) tolerance))

(sqrt 9 0.0001)