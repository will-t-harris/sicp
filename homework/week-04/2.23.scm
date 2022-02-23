#lang scheme
(define (for-each proc lst)
  (if (null? lst)
      #t
  (cons (proc (car lst)) (for-each proc (cdr lst)))))