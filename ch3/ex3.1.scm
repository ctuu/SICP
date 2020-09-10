(define (make-accumulator init)
  (lambda (acc)
    (begin (set! init (+ init acc))
            init)))

(define A (make-accumulator 5))

(A 10)

(A 10)