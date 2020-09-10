(load "ch2/2.56.scm")

(caddr '(+ 1 2 3))
(cons '+ (cddr '(+ 1 2)))

(define (augend s)
  (let ((rest (cddr s)))
       (if (null? rest)
           0
           (cons '+ rest))))

(define (multiplicand p)
  (let ((rest (cddr p)))
       (if (null? rest)
           1
           (cons '* rest))))

(define (binary-expression? e)
  (null? (cdddr e)))

(define (second-term e)
  (caddr e))
 
(define (all-but-first-term e)
  (cddr e))

(define (reduce-expression e op)
  (if (binary-expression? e)
      (second-term e)
      (cons op (all-but-first-term e))))
 
(define (augend s) (reduce-expression s '+))

(define (multiplicand p) (reduce-expression p '*))

(deriv '(* x y (+ x 3)) 'x)

(deriv '(+ x 3 4 (* 2 x 3)) 'x)
       
