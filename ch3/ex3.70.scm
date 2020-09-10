(load "ch3/3.67.scm")
(load "ch3/3.56.scm")

(define (merge-weighted s1 s2 weight)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else
         (let ((s1car (stream-car s1))
               (s2car (stream-car s2)))

          (if (> (weight (car s1car) (cadr s1car)) (weight (car s2car) (cadr s2car)))
              (cons-stream s2car (merge-weighted s1 (stream-cdr s2) weight))
              (cons-stream s1car (merge-weighted (stream-cdr s1) s2 weight)))))))

(define (weighted-pairs s t weight)
  (cons-stream
    (list (stream-car s) (stream-car t))
    (merge-weighted
      (stream-map (lambda (x) (list (stream-car s) x))
                  (stream-cdr t))
      (weighted-pairs (stream-cdr s) (stream-cdr t) weight)
      weight)))

(stream-ref (stream-map show (weighted-pairs integers integers (lambda (i j) (+ i j)))) 5)

(stream-ref (stream-map show (weighted-pairs S
                                             S
                                             (lambda (i j) (+ (* 2 i)
                                                              (* 3 j)
                                                              (* 5 i j)))))
            5)