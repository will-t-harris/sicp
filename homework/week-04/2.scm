#lang simply-scheme
(define substitute2
  (lambda (l oldl newl)
    (cond
      ((null? l) '())
      ((word? (car l))
       (cond
         


(substitute2 '((4 calling birds) (3 french hens) (2 turtle doves)) '(1 2 3 4) '(one two three four)) "should equal" ((four calling birds) (three french hens) (two turtle doves))
