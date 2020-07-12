(define (make-tree key value left right)
  (list key value left right))

(define (key-tree tree) (car tree))
(define (value-tree tree) (cadr tree))
(define (left-branch-tree tree) (caddr tree))
(define (right-branch-tree tree) (cadddr tree))

(define (set-key-tree! tree value) (set-car! tree value))
(define (set-value-tree! tree value) (set-car! (cdr tree) value))
(define (set-left-branch-tree! tree value) (set-car! (cddr tree) value))
(define (set-right-brnach-tree! tree value) (set-cdr! (cdddr tree) value))

(define (empty-tree? tree) (null? tree))

(define (lookup-tree tree key compare)
  (if (empty-tree? tree)
      false
      (let ((result (compare key (key-tree tree))))
        (cond ((= 0 result) tree)
              ((< 0 result) (lookup-tree (left-branch-tree tree) key compare))
              (else (lookup-tree (right-branch-tree tree) key compare))))))


(define (insert-tree! tree key value compare)
  (if (empty-tree? tree)
      (make-tree key value '() '())
      (let ((result (compare key (key-tree tree))))
        (cond ((= 0 result)
                 (set-value-tree! tree value)
                 tree)
              ((< 0 result)
                 (set-left-branch-tree! tree (insert-tree! (left-branch-tree tree) key value compare))
                 tree)
              (else
                (set-right-branch-tree! tree (insert-tree! (right-branch-tree) key value compare)
                tree))))))

(define (make-table compare)

  (let ((local-table (list '*table*)))
    (define (lookup key)
      (value-tree (lookup-tree (cdr local-table) key compare)))

    (define (insert! key value)
      (set-cdr! local-table (insert-tree! (cdr local-table) key value compare))
      'ok)

    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation -- TABLE" m))))
    dispatch))

(define (numeric-compare a b)
  (cond ((= a b) 0)
        ((< a b) -1)
        (else 1)))

(define operation-table (make-table numeric-compare))
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc!))

(put 1 'qwe)
(get 1)

(put 2 'asd)
(get 2)

(put 3 'zxc)
(get 3)

(put 2 'dfg)
(get 2)