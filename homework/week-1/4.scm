#lang simply-scheme
(define (ordered? sentence)
  (cond ((equal? (bf sentence) '()) #t)
        ((< (first sentence) (first (bf sentence))) (ordered? (bf sentence)))
        (else #f)))