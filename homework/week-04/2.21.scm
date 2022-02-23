#lang scheme
(define (square-list items)
  (if (null? items)
      '()
      (cons (sqr (car items)) (square-list (cdr items)))))

(define (square-list-map items)
  (map (lambda (x) (sqr x)) items))