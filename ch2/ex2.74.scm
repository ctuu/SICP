(define (id file) (car file))
(define (content file) (cdr file))

(define (get-record file name)
  ((get 'get-record (id file)) (content file) name))

(define (get-salary file name)
  ((get 'get-salary (id file)) (content file) name))

(define (find-employee-record name files)
  (map (lambda (file) (get-record file name)) files))