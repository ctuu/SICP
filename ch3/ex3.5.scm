(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (estimate-integral p x1 x2 y1 y2 trials)
  (define (test)
    (p (random-in-range x1 x2) (random-in-range y1 y2)))
  (* (monte-carlo trials test) (- x2 x1) (- y2 y1)))

(define (circle x y)
  (< 1.0 (+ (square (- x 1)) (square (- y 1)))))

(estimate-integral circle -1.0 1.0 -1.0 1.0 10000)
