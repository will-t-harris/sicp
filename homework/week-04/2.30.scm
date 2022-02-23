#lang scheme
(define (square-tree-direct tree)
  (cond
    ((null? tree) '())
    ((not (pair? (car tree))) (cons (sqr (car tree)) (square-tree-direct (cdr tree))))
    (else (cons (square-tree-direct (car tree)) (square-tree-direct (cdr tree))))))

(define (square-tree-map tree)
  (map (lambda (sub-tree)
         (cond
           ((null? sub-tree) '())
           ((not (pair? sub-tree)) (sqr sub-tree))
           (else (square-tree-map sub-tree))))
       tree))

(square-tree-direct (list 1 (list 2 (list 3 4) 5) (list 6 7))) "should equal" '(1 (4 (9 16) 25) (36 49)) (newline)
(square-tree-map (list 1 (list 2 (list 3 4) 5) (list 6 7))) "should equal" '(1 (4 (9 16) 25) (36 49)) (newline)