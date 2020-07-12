(load "ch3/3.70.scm")

(define (cube-sum i j)
  (+ (* i i i) (* j j j)))

(define (stream-limit stream)
  (let ((n (stream-car stream))
        (n+1 (stream-car (stream-cdr stream))))
    (if (= n n+1)
        (cons-stream n (stream-limit (stream-cdr stream)))
        (stream-limit (stream-cdr stream)))
    ))

(define ramanujan (stream-limit (stream-map (lambda (x) (cube-sum (car x) (cadr x)))
                                            (weighted-pairs integers integers cube-sum))))

(stream-ref (stream-map show ramanujan) 5)