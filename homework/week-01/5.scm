#lang simply-scheme
(define (ends-with-e sentence)
  (cond ((equal? sentence '()) '())
        ((equal? (last (first sentence)) 'e) (se (first sentence) (ends-with-e (bf sentence))))
        ((se (ends-with-e (bf sentence))))
        ))