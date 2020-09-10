(load "ch3/3.54.scm")

(define (integrate-series stream)
  (stream-map / stream integers))

(stream-ref (stream-map show (integrate-series ones)) 10)

(define exp-series
  (cons-stream 1 (integrate-series exp-series)))

(define cosine-series
  (cons-stream 1 (stream-map - (integrate-series sine-series))))

(define sine-series
  (cons-stream 0 (integrate-series cosine-series)))

(stream-ref (stream-map show cosine-series) 10)