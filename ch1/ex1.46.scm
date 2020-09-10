(define (iterative-improve good-enough? improve)
  (lambda (x) (if (good-enough? x)
                  (improve x)
                  ((iterative-improve good-enough? improve) (improve x)))))


(define (average x y) (/ (+ x y) 2))

(define (sqrt n)
  (define (good-enough? guess) (< (abs (- (square guess) n)) 0.001))
  (define (improve guess) (average guess (/ n guess)))
  ((iterative-improve good-enough? improve) 1.0))

(sqrt 9)

(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (good-enough? guess) (< (abs (- guess (f guess))) tolerance))
  ((iterative-improve good-enough? f) first-guess))


(fixed-point cos 1.0)  