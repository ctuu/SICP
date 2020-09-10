(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(car (cons 4 7))

(cdr (cons 4 7))

(cdr (lambda (m) (m 4 7)))

((lambda (m) (m 4 7)) (lambda (p q) q))

((lambda (p q) q) 4 7)