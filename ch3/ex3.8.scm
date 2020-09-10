(define f
  (let ((y 1))
    (lambda (x)
      (set! y (* y x))
      y)))

(+ (f 0) (f 1))

(+ (f 1) (f 0))