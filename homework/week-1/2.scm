#lang simply-scheme
(define (square x) (* x x))

(define (square-sentence s)
  (if (empty? s)
      '()
      (se (square (first s))
          (square-sentence (bf s)))))