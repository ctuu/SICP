(define (make-account balance password)
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
  (define (dispatch p m)
    (if (eq? p password)
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              (else (error "Unknown request -- MAKE_ACCOUNT"
                           m)))
        wrong-password))
    dispatch)

(define (make-joint acc password new-password)
  (define (wrong-password x)
    "Incorrect password")
  (define (dispatch p m)
    (if (eq? p new-password)
        (acc password m)
        wrong-password))
  dispatch)

(define peter-acc (make-account 100 'open-sesame))

((peter-acc 'open-sesame 'withdraw) 40)

(define paul-acc
  (make-joint peter-acc 'open-sesame 'rosebud))


((paul-acc 'rosebud 'withdraw) 40)