(load "ch2/2.62.scm")
(load "ch2/2.64.scm")

(define (union-tree tree1 tree2)
  (list->tree (union-set (tree->list-2 tree1)
                         (tree->list-2 tree2))))

(define (intersection-tree tree1 tree2)
  (list->tree (intersection-set (tree->list-2 tree1)
                                (tree->list-2 tree2))))

(union-tree (list->tree '(1 3 5 7 9 11)) (list->tree '(1 3 5)))

(intersection-tree (list->tree '(1 3 5 7 9 11)) (list->tree '(1 3 5)))