(load "ch1/1.35.scm")
(load "ch1/1.43.scm")

(define (average x y) (/ (+ x y) 2))

(define (average-damp f) (lambda (x) (average x  (f x))))

(define (multi-n n)
  (lambda (y) ((repeated (lambda (x) (* x y))
                         n)
               1)))

(define (n-root-damp n times)
  (lambda (x) (fixed-point (repeated (average-damp (lambda (y) (/ x 
                                                                ((multi-n (- n 1)) y))))
                                     times)
                           1.0)))

; ((n-root-damp 8 3) 256)

(define (lg n)
  (cond ((> (/ n 2) 1)
         (+ 1 (lg (/ n 2))))
        ((< (/ n 2) 0)
         0)
        (else
         1)))

(lg 8)

(define (nth-root n)
  (n-root-damp n (lg n)))

((nth-root 3) 8)
