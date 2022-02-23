#lang scheme
(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

; 2.29(a)
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

; 2.29(b)
(define (total-weight mobile)
  (cond
    ((null? mobile) 0)
    ((not (pair? mobile)) mobile)
    (else (+ (total-weight (branch-structure (left-branch mobile))) (total-weight (branch-structure (right-branch mobile)))))))

(define a (make-mobile (make-branch 2 3) (make-branch 2 3))) 
(total-weight a) "should equal" 6 (newline)

; 2.29(c)
(define (torque branch)
  (* (branch-length branch) (total-weight (branch-structure branch))))

(define (balanced? mobile)
  (cond
    ((not (pair? mobile)) #t)
    (else (and
           (= (torque (left-branch mobile)) (torque (right-branch mobile)))
           (balanced? (branch-structure (left-branch mobile)))
           (balanced? (branch-structure (right-branch mobile)))))))

(define d (make-mobile (make-branch 10 a) (make-branch 12 5)))
;; structure looks like ((10 ((2 3) (2 3))) (12 5))
(balanced? d) "should equal" #t (newline)

; 2.29(d)
; If we change the constructors to use `cons` instead of `list`:
(define (make-mobile-cons left right)
  (cons left right))

(define (make-branch-cons length structure)
  (cons length structure))

; we'd only need to update our selectors to:
(define (left-branch-cons mobile)
  (car mobile))

(define (right-branch-cons mobile)
  (cdr mobile))

(define (branch-length-cons branch)
  (car branch))

(define (branch-structure-cons branch)
  (cdr branch))

; test new representation
(define a-cons (make-mobile (make-branch 2 3) (make-branch 2 3))) 
(total-weight a-cons) "should equal" 6 (newline)

(define d-cons (make-mobile (make-branch 10 a) (make-branch 12 5)))
;; structure looks like ((10 ((2 3) (2 3))) (12 5))
(balanced? d-cons) "should equal" #t (newline)
