(define (make-table same-key?)
  (define (assoc key records)
    (cond ((null? records) false)
          ((same-key? key (caar records)) (car records))
          (else (assoc key (cdr records)))))

  (define (assoc-table table key)
    (assoc key (cdr table)))

  (define (fold-left-every op initial segment)
    (define (iter result rest)
      (if (or (null? rest) (not result))
          result
          (iter (op result (car rest)) (cdr rest))))
      (iter initial segment))

  (let ((local-table (list '*table*)))
    (define (lookup keys)
      (let ((record (fold-left-every assoc-table local-table keys)))
        (if record
            (cdr record)
            false)))

  (define (insert! keys value)
    (define (op table key)
      (let ((record (assoc-table table key))
            (new-table (cons key '())))
        (if record
            record
            (begin (set-cdr! table (cons new-table (cdr table)))
                   new-table))))

    (set-cdr! (fold-left-every op local-table keys) value)
    'ok)

    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation -- TABLE" m))))
    dispatch))

(define operation-table (make-table equal?))
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc!))

(put (list 'key) 456)
(get (list 'key))

(put (list 'key-1 'key-2 'key-3) 123)
(get (list 'key-1 'key-2 'key-3))

(put (list 'key-1 'key-2 'key-3) 666)
(get (list 'key-1 'key-2 'key-3))