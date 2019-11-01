(load "ch2/2.36.scm")

(define x (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))

(define a (list 1 2))
(define b (list 3 4))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(dot-product a b)

(define (matrix-*-vector m v)
  (map (lambda (w) (dot-product v w)) m))

(define (transpose mat)
  (accumulate-n cons () mat)) 

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (w) (map (lambda (col) (dot-product col w))
                          cols))
         m)))

(define c (list (list 1 2) (list 3 4)))
(define d (list (list 5 6) (list 7 8)))
(matrix-*-matrix c d)
