#lang simply-scheme
(define (substitute2 seq old-words new-words)
  ; If seq is a word, try to substitute it
  (cond ((word? seq)
         (substitute-words seq old-words new-words))
        ; If seq is a list, map over the list to access the words
        ((list? seq) (map (lambda (seq) (substitute2 seq old-words new-words)) seq))))

(define (substitute-words wd old-words new-words)
  ; If there are no other old-words to check, return the original word
  (if (null? old-words)
    wd
    ; If the word is equal to the car of the old-words list, return the car of the new-words list
    (if (equal? wd (car old-words))
      (car new-words)
      ; Otherwise, recur on the cdr of both to see if the word matches any others in our lists
      (substitute-words wd (cdr old-words) (cdr new-words)))))


(substitute2  '((4 calling birds) (3 french hens) (2 turtle doves)) '(1 2 3 4) '(one two three four)) "should equal" '((four calling birds) (three french hens) (two turtle doves))
