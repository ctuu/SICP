(load "ch1/1.43.scm")

(define dx 0.00001)

(define (smooth f)
  (lambda (x) (/ (+ (f (+ x dx)) (f x) (f (- x dx)))
                 3)))

(define (smooth-n-times f n)
  ((repeated smooth n) f))

((smooth square) 5)

((smooth-n-times square 10) 5)