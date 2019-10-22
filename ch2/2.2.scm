(define (make-segment start-point end-point) (cons start-point end-point))

(define (start-segment seg) (car seg))

(define (end-segment seg) (cdr seg))

(define (make-point x y) (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (midpoint-segment s)
  (define (average x y) (/ (+ x y) 2.0))
  (make-point (average (x-point (end-segment s)) (x-point (start-segment s)))
              (average (y-point (end-segment s)) (y-point (start-segment s)))))


(define point-1-2 (make-point 1 2))
(define point-5-7 (make-point 5 7))

(print-point (midpoint-segment (make-segment point-1-2 point-5-7)))

(print-point (midpoint-segment (make-segment point-1-2 point-5-7)))
    