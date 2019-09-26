(define (cube-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-iter (improve guess x) 
                 x)))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 
     0.001))

(define (cube x)
  (* x x x))


(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess))
     3))

(define (cube-root x)
  (cube-iter 1.0 x))

(cube-root 27)
(cube-root (* 5 5 5))
(cube-root (* 7 7 7))