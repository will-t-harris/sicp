#lang simply-scheme
; Generalize this pattern to create a higher-order procedure called every that
; applies an arbitrary procedure, given as an argument, to each word of an
; argument sentence.
(define (square x) (* x x))

(define (every f l)
  (cond ((empty? l) '())
        (else (se (f (first l)) (every f (bf l))))))