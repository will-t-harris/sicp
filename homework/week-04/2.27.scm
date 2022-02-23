#lang scheme
(define (deep-reverse l)
    (cond
      ((null? l) '())
      ((pair? (car l))
       (append (deep-reverse (cdr l)) (list (deep-reverse (car l)))))
      (else
       (append (deep-reverse (cdr l)) (list (car l))))))

(deep-reverse (list 1 4 9 16 25)) "should equal" '(25 16 9 4 1) (newline)
(deep-reverse (list (list 1 2) (list 3 4))) "should equal" '((4 3) (2 1)) (newline)