(define (make-node value prev next) (cons value (cons prev next))) ; (cons 'value (cons 'prev 'next))

(define (value-node node) (car node))

(define (prev-node node) (cadr node))

(define (next-node node) (cddr node))

(define (set-value-node! node item) (set-car! node item))

(define (set-prev-node! node item) (set-car! (cdr node) item))

(define (set-next-node! node item) (set-cdr! (cdr node) item))

(define (front-ptr deque) (car deque))

(define (rear-ptr deque) (cdr deque))

(define (set-front-ptr! deque item) (set-car! deque item))

(define (set-rear-ptr! deque item) (set-cdr! deque item))

(define (empty-deque? deque) (null? (front-ptr deque)))

(define (make-deque) (cons '() '()))

(define (front-deque deque)
  (if (empty-deque? deque)
      (error "FRONT called with an empty deque" deque)
      (front-ptr deque)))

(define (rear-deque deque)
  (if (empty-deque? deque)
      (error "REAR called with an empty deque" deque)
      (rear-ptr deque)))

(define (insert-to-empty-deque! deque new-node)
  (set-front-ptr! deque new-node)
  (set-rear-ptr! deque new-node)
  (print-deque deque))

(define (front-insert-deque! deque item)
  (let ((new-node (make-node item '() '())))
    (cond ((empty-deque? deque)
           (insert-to-empty-deque! deque new-node))
          (else
           (set-next-node! new-node (front-ptr deque))
           (set-prev-node! (front-ptr deque) new-node)
           (set-front-ptr! deque new-node)
           (print-deque deque)))))

(define (rear-insert-deque! deque item)
  (let ((new-node (make-node item '() '())))
    (cond ((empty-deque? deque)
           (insert-to-empty-deque! deque new-node))
          (else
           (set-next-node! (rear-ptr deque) new-node)
           (set-prev-node! new-node (rear-ptr deque))
           (set-rear-ptr! deque new-node)
           (print-deque deque)))))

(define (front-delete-deque! deque)
  (cond ((empty-deque? deque)
         (error "DELETE! called with an empty deque" deque))
        ((eq? (front-ptr deque) (rear-ptr deque))
         (set-front-ptr! deque '())
         (set-rear-ptr! deque '()))
        (else
         (set-front-ptr! deque (next-node (front-ptr deque)))
         (print-deque deque))))

(define (rear-delete-deque! deque)
  (cond ((empty-deque? deque)
         (error "DELETE! called with an empty deque" deque))
        ((eq? (front-ptr deque) (rear-ptr deque))
         (set-front-ptr! deque '())
         (set-rear-ptr! deque '()))
        (else
         (set-rear-ptr! deque (prev-node (rear-ptr deque)))
         (set-next-node! (rear-ptr deque) '())
         (print-deque deque))))

(define (print-deque deque)
  (define (print-node node)
    (if (null? node)
        '()
        (cons (value-node node) (print-node (next-node node)))))
  (if (null? deque)
      '()
      (print-node (front-ptr deque))))

(define q (make-deque))

(front-insert-deque! q 2)

(front-insert-deque! q 1)

(rear-insert-deque! q 3)

(front-delete-deque! q)

(rear-delete-deque! q)

(empty-deque? q)

(rear-delete-deque! q)

(empty-deque? q)
