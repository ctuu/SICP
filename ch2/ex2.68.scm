(load "ch2/2.67.scm")

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (cond ((not (symbol-in-tree? symbol (symbols tree)))
         (error "bad symbol -- ENCODE_SYMBOL" symbol))
        ((leaf? tree)
         '())
        ((symbol-in-tree? symbol (symbols (left-branch tree)))
         (cons 0 (encode-symbol symbol (left-branch tree))))
        (else (cons 1 (encode-symbol symbol (right-branch tree))))))

(define (symbol-in-tree? symbol list)
  (cond ((null? list) false)
        ((eq? symbol (car list)) true)
        (else (symbol-in-tree? symbol (cdr list)))))

sample-message

(encode (decode sample-message sample-tree) sample-tree)
