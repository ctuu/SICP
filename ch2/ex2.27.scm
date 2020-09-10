(load "ch2/2.18.scm")

(define (deep-reverse items)
  (define (tree-reverse items)
    (if (pair? items)
        (deep-reverse items)
        items))
  (define (reverse-iter items cur)
    (if (null? items)
        cur
        (reverse-iter (cdr items) 
                      (cons (tree-reverse (car items))
                                          cur))))
  (reverse-iter items ()))


(define x (list (list 1 2) (list 3 4)))

x
(reverse x)
(deep-reverse x)

(deep-reverse (list (list 1 2) (list 3 4) (list 5 6)))