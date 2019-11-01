(load "ch2/2.38.scm")

(define x (list 1 2 3 4))

(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x)))
              () sequence))

(reverse x)

(define (reverse sequence)
  (fold-left (lambda (x y) (cons y x)) () sequence))

(reverse x)
