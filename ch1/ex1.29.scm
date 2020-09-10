(define (cube x) (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)

  (define (add-dx x) (+ x dx))

  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(integral cube 0 1 0.01)

(integral cube 0 1 0.001)

(define (simpson f a b n)

  (define h (/ (- b a) (* n 1.0)))

  (define (next k) (+ k 1))

  (define (y k) (f (+ a (* k h))))

  (define (factor k) (cond ((or (= k 0) (= k n)) 1)
                           ((even? k)            2)
                           (else                 4)))

  (define (term k) (* (factor k) (y k)))
  (* (/ h 3.0) 
     (sum term a next n)))

(simpson cube 0 1 100)

(simpson cube 0 1 1000)
