#lang simply-scheme
(every (lambda (letter) (word letter letter)) 'purple)
; '(pp uu rr pp ll ee)

(every (lambda (number) (if (even? number) 
                            (word number number) 
                            number))
                            '(781 5 76 909 24))
; '(781 5 7676 909 2424)

(keep even? '(781 5 76 909 24))
; '(76 24)

(keep (lambda (letter) (member? letter 'aeiou)) 'bookkeeper)
; 'ooeee

(keep (lambda (letter) (member? letter 'aeiou)) 'syzygy)
; ''

(keep (lambda (letter) (member? letter 'aeiou)) '(purple syzygy))
; Error

(keep (lambda (wd) (member? 'e wd)) '(purple syzygy))
; '(purple)