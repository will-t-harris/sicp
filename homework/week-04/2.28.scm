#lang scheme
(define (fringe tree)
  (cond
    ((null? tree) '())
    ((not (pair? tree)) (list tree))
    (else (append (fringe (car tree)) (fringe (cdr tree))))))
    


(define x (list (list 1 2) (list 3 4)))
(fringe x) "should equal" '(1 2 3 4)