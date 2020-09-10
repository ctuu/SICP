(define (product-a term a next b)
  (if (> a b)
      1 
      (* (term a) (product-a term (next a) next b))))

(define (product-b term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))


(define (pi n)

  (define (term a)
    (if (even? a)
        (/ a (+ a 1))
        (/ (+ a 1) a)))

  (define (inc a) (+ a 1))

  (* 4.0 (product-b term 2 inc n)))

(pi 10)

(pi 100)

(pi 1000)

(pi 10000)

(pi 100000)