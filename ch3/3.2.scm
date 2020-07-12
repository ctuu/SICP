(define (make-monitored f)
  (let ((time 0))
    (define (call arg)
      (begin (set! time (+ time 1))
             (f arg)))

    (define (dispatch m)
      (cond ((eq? m 'how-many-calls?) time)
            ((eq? m 'reset-count) (set! time 0))
            (else (call m))))
    dispatch))

(define s (make-monitored sqrt))

(s 100)

(s 'how-many-calls?)

(s 'reset-count)

(s 'how-many-calls?)
