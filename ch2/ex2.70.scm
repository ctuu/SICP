(load "ch2/2.68.scm")
(load "ch2/2.69.scm")

(define sing-tree (generate-huffman-tree '((A 2)    (NA 16)
                                           (BOOM 1) (SHA 3)
                                           (GET 2)  (YIP 9)
                                           (JOB 2)  (WAH 1))))


(encode '(Get a job) sing-tree)
(length (encode '(Get a job) sing-tree))

(encode '(Sha na na na na na na na na) sing-tree)
(length (encode '(Sha na na na na na na na na) sing-tree))

(encode '(Get a job) sing-tree)
(length (encode '(Get a job) sing-tree))

(encode '(Sha na na na na na na na na) sing-tree)
(length (encode '(Sha na na na na na na na na) sing-tree))

(encode '(Wah yip yip yip yip yip yip yip yip yip) sing-tree)
(length (encode '(Wah yip yip yip yip yip yip yip yip yip) sing-tree))

(encode '(Sha boom) sing-tree)
(length (encode '(Sha boom) sing-tree))