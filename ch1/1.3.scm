(define (square x) (* x x))

(define (sum-of-squares x y)
    (+ (square x) (square y)))

(define (bigger x y) (if (< x y) y x))
(define (smaller x y) (if (< x y) x y))

(define (bigger-sum-of-squares x y z)
    (sum-of-squares (bigger x y) 
                    (bigger (smaller x y) z))
)

; (bigger-sum-of-squares 1 2 3)
(square 2)
(sum-of-squares 2 3)
(bigger 2 3)
(smaller 2 3)
(bigger-sum-of-squares 1 2 3)