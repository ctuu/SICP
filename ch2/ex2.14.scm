(load "ch2/2.12.scm")

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                   (add-interval (div-interval one r1)
                                 (div-interval one r2)))))


(define r1 (make-center-percent 1 20))
(define r2 (make-center-percent 5 20))

(define a (par1 r1 r2))
(define b (par2 r1 r2))

(lower-bound a)
(upper-bound a)

(lower-bound b)
(upper-bound b)

(define a (div-interval r2 r1))
(define b (div-interval r2 r2))

(lower-bound a)
(upper-bound a)

(lower-bound b)
(upper-bound b)