(list 1 3 (list 5 7) 9)

(car (cdaddr (list 1 3 (list 5 7) 9)))
; ((7))

(list (list 7))
(caar (list (list 7)))
; caar

(list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7))))))
(cadadr (cadadr (cadadr (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))))