(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    (define (set-front-ptr! item) (set! front-ptr item))
    (define (set-rear-ptr! item) (set! rear-ptr item))
    (define (empty-queue?) (null? front-ptr))

    (define (insert-queue! item)
      (let ((new-pair (cons item '())))
        (cond ((empty-queue?)
               (set-front-ptr! new-pair)
               (set-rear-ptr! new-pair)
               front-ptr)
              (else
               (set-cdr! rear-ptr new-pair)
               (set-rear-ptr! new-pair)
               front-ptr))))

    (define (delete-queue!)
      (cond ((empty-queue?)
             (error "DELETE! called with an empty queue"))
            (else
              (set-front-ptr! (cdr front-ptr))
              front-ptr)))

    (define (dispatch m)
      (cond ((eq? 'empty-queue m)
             (empty-queue))
            ((eq? 'insert-queue! m)
             insert-queue!)
            ((eq? 'delete-queue! m)
             (delete-queue!))
            (else
              (error "Unknown request -- MAKE_QUEUE"))))

    dispatch))

(define q (make-queue))

((q 'insert-queue!) 'a)

((q 'insert-queue!) 'b)

(q 'delete-queue!)

(q 'delete-queue!)