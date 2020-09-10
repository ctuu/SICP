(define (make-account balance password)
  (let ((try-times 0)
        (max-try-times 7))

        (define (withdraw amount)
          (if (>= balance amount)
              (begin (set! balance (- balance amount))
                      balance)
              "Insufficient funds"))
        (define (deposit amount)
          (set! balance(+ balance amount))
          balance)
        (define (wrong-password x)
          "Incorrect password")
        (define (call-the-cops x)
          "Call the Cops")
        (define (dispatch p m)
          (if (eq? p password)
              (begin (set! try-times 0)
                     (cond ((eq? m 'withdraw) withdraw)
                           ((eq? m 'deposit) deposit)
                           (else (error "Unknown request -- MAKE_ACCOUNT"
                                        m))))
              (begin (set! try-times (+ try-times 1))
                     (if (>= try-times max-try-times)
                         call-the-cops
                         wrong-password))))
          dispatch))

(define acc (make-account 100 'secret-password))

((acc 'secret-password 'withdraw) 40)

((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)

((acc 'secret-password 'withdraw) 40)

((acc 'some-other-password 'deposit) 50)