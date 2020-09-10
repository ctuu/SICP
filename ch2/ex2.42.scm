(load "ch2/2.40.scm")


(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
          (lambda (positions) (safe? k positions))
          (flatmap
            (lambda (rest-of-queens)
              (map (lambda (new-row)
                     (adjoin-position new-row k rest-of-queens))
                   (enumerate-interval 1 board-size)))
            (queen-cols (- k 1))))))
  (queen-cols board-size))

(define empty-board ())

(define (safe? k positions)
  (define new-row (car positions))
  (define rest-of-queens (cdr positions))

  (define (safe-iter i position)
    (cond ((null? position) true)
          ((= new-row (car position)) false)
          ((= new-row (+ (car position) i)) false)
          ((= new-row (- (car position) i)) false)
          (else (safe-iter (+ i 1) (cdr position)))))
  (safe-iter 1 rest-of-queens))

(define (adjoin-position new-row k rest-of-queens)
  (cons new-row rest-of-queens)
)

; (queens 8)

(accumulate + 0 (map (lambda (x) 1) (queens 8)))