(load "ch2/2.10.scm")

(define (mul-interval x y)
  (let ((lx (lower-bound x))
        (ly (lower-bound y))
        (ux (upper-bound x))
        (uy (upper-bound y)))
       (if (> lx 0) 
           (if (> ly 0) 
               (make-interval (* lx ly) (* ux uy)) ;++:++
               (if (> uy 0)
                   (make-interval (* ux ly) (* ux uy)) ;++:-+
                   (make-interval (* ux ly)(* lx  uy)))) ;++:--
           (if (> ux 0)
               (if (> ly 0)
                   (make-interval (* lx uy) (* ux uy)) ; -+:++
                   (if (> uy 0)
                       (make-interval (min (* lx uy) (* ly ux))  ; -+:-+
                                      (max (* lx ly) (* ux uy))) 
                       (make-interval (* ux ly) (* lx ly)))) ; -+:--
               (if (> ly 0)
                   (make-interval (* lx uy) (* ux ly)) ; --:++
                   (if (> uy 0)
                       (make-interval (* lx uy) (* lx ly)) ; --:-+
                       (make-interval (* ux uy) (* lx ly)))))))) ; --:--

(mul-interval  (make-interval 1 3)
               (make-interval 4 6))
             
           