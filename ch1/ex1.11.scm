(define (f1 n)
  (cond ((< n 3) n)
        (else (+ (f1 (- n 1))
                 (* (f1 (- n 2)) 2)
                 (* (f1 (- n 3)) 3)))))

(define (f2 n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        ((= n 2) 2)
        (else (f2-iter 4 2 1 (- n 3)))))

(define (f2-iter a b c n)
  (if (= n 0) a
      (f2-iter (+ a (* b 2) (* c 3)) 
               a
               b
               (- n 1))))

(f1 6)

(f2 6)