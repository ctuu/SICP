(load "ch3/3.52.scm")

(define (add-stream s1 s2)
  (stream-map + s1 s2))

(define s (cons-stream 1 (add-stream s s)))

(stream-ref s 7)