(define (fringe tree)
  (cond ((pair? tree) (append (fringe (car tree))
                              (fringe (cdr tree))))
        ((null? tree) ())
        (else (list tree))))

(define x (list (list 1 2) (list 3 4)))

; x

(fringe x)

(fringe (list x x))
