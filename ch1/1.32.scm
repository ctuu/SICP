(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (accumulate-b combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (sum-combiner a b) (+ a b))

(define (product-combiner a b) (* a b))

(define (cube x) x)

(define (inc a) (+ a 1))

(accumulate sum-combiner 0 cube 1 inc 10)
(accumulate-b sum-combiner 0 cube 1 inc 10)

(accumulate product-combiner 1 cube 1 inc 10)
(accumulate-b product-combiner 1 cube 1 inc 10)