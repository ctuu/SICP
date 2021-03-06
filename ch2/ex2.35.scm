(load "ch2/2.33.scm")

(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) (if (pair? x)
                                       (count-leaves x)
                                       1))
                       t)))

(define x (cons (list 1 2) (list 3 4)))

(count-leaves x)

(count-leaves (list x x))