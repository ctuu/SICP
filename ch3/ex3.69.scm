(load "ch3/3.67.scm")

(define (triples s t u)
  (cons-stream
    (list (stream-car s) (stream-car t) (stream-car u))
    (interleave
      (stream-map (lambda (x) (append (list (stream-car s)) x))
                  (pairs t u))
      (triples (stream-cdr s) (stream-cdr t) (stream-cdr u)))))

(define pythagorean-triples
  (stream-filter (lambda (x) (= (+ (square (car x))
                                   (square (cadr x)))
                                (square (caddr x))))
                 (triples integers integers integers)))

(stream-ref (stream-map show pythagorean-triples) 3)