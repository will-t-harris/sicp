#lang simply-scheme
(define (replace-word w)
  (cond ((or (equal? w 'I) (equal? w 'me))'you)
        ((equal? w 'you) 'me)
        (w)))
        
(define (switch s)
  (cond ((empty? s) '())
        ((equal? (first s) 'You) (se 'I (switch (bf s))))
        ((se (replace-word (first s)) (switch (bf s))))))