#lang scheme
(define reverse
  (lambda (l)
    (cond
      ((null? l) '())
      (else (append (reverse (cdr l)) (list (car l)))))))

(reverse (list 1 4 9 16 25)) "should equal" '(25 16 9 4 1)