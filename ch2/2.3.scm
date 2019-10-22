(load "ch2/2.2.scm")

(define (make-rect bottom-left top-right) (cons bottom-left top-right))

(define (bottom-left rect) (car rect))

(define (top-right rect) (cdr rect))

(define (length-rect rect)
  (abs (- (x-point (top-right rect)) (x-point (bottom-left rect)))))

(define (width-rect rect)
  (abs (- (y-point (top-right rect)) (y-point (bottom-left rect)))))

(define (circum-rect rect)
  (+ (* (length-rect rect) 2) (* (width-rect rect) 2)))

(define (space-rect rect)
  (* (length-rect rect) (width-rect rect)))

(define point-1-2 (make-point 1 2))
(define point-5-7 (make-point 5 7))
(define rect-1 (make-rect point-1-2 point-5-7))

(length-rect rect-1)

(width-rect rect-1)

(circum-rect rect-1)

(space-rect rect-1)

(define (make-rect-2 bottom-left length width)
  (cons bottom-left (make-point (+ (x-point bottom-left) length)
                                (+ (y-point bottom-left) width))))

(define rect-2 (make-rect-2 point-1-2 4 5))

(length-rect rect-2)

(width-rect rect-2)

(circum-rect rect-2)

(space-rect rect-2)