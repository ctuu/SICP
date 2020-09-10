(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess step)
    (newline)
    (display "Step ")
    (display step)
    (display ": ")
    (display guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next (+ step 1)))))
  (try first-guess 0))

(define (average x y) (/ (+ x y) 2))

(define (average-damp f) (lambda (x) (average x  (f x))))

(define formula (lambda (x) (/ (log 1000) (log x))))



(fixed-point formula 2.0)

(fixed-point (average-damp formula) 2.0)