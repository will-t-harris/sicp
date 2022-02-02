;;; Write a procedure substitute that takes three arguments: a list, an old word, and a
;;; new word. It should return a copy of the list, but with every occurrence of the old word
;;; replaced by the new word, even in sublists.
#lang simply-scheme
(define substitute
  (lambda (old new l)
    (cond
      ((null? l) '())
      ((word? (car l))
       (cond
         ((equal? (car l) old)
                  (cons new
                        (substitute old new (cdr l))))
         (else (cons (car l)
                     (substitute old new (cdr l))))))
      (else
       (cons (substitute old new (car l)) (substitute old new (cdr l)))))))


(substitute 'guitar 'axe '((lead guitar) (bass guitar) (rhythm guitar) drums)) "should equal" '((lead axe) (bass axe) (rhythm axe) drums)