(load "ch2/2.56.scm")

(define get 2d-get)
(define put 2d-put!)

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else ((get 'deriv (operator exp)) (operands exp)
                                            var))))

(define (operator exp) (car exp))
(define (operands exp) (cdr exp))



(define (install-deriv-package)
  (define (addend s) (car s))
  (define (augend s) (cadr s))
  (define (multiplier p) (car p))
  (define (multiplicand p) (cadr p))

  (define (base x) (car x))
  (define (exponent x) (cadr x))

  (put 'deriv '+ (lambda (exp var) (make-sum (deriv (addend exp) var)
                                             (deriv (augend exp) var))))
  (put 'deriv '* (lambda (exp var) (make-sum (make-product (multiplier exp)
                                                           (deriv (multiplicand exp) var))
                                             (make-product (deriv (multiplier exp) var)
                                                           (multiplicand exp)))))
  (put 'deriv '** (lambda (exp var) (let ((u (base exp))
                                          (n (exponent exp)))
                                         (make-product (make-product n
                                                                     (make-exponentitation u
                                                                                           (make-sum n -1)))
                                                       (deriv u var)))))
  'done)

(install-deriv-package)

(deriv '(+ x 3) 'x)

(deriv '(* x y) 'x)

(deriv '(* (* x y) (+ x 3)) 'x)

(deriv '(** u n) 'x)

(deriv '(** x 0) 'x)

(deriv '(** x 1) 'x)

(deriv '(** x 2) 'x)

(deriv '(** x 3) 'x)