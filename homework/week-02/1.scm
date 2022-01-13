#lang simply-scheme
; I needed to look some of this up -- felt a bit too math-heavy for me

; 1.31(a)
; helper procedures
(define (next x) (+ x 1.0))
(define (identity x) x)

; returns the product of the values of a function at points over a given range (a, b)
(define (product term a next b)
  (if (> a b) 1.0
      (* (term a) (product term (next a) next b))))

; factorial procedure using product
(define (factorial n)
  (product identity 1.0 next n))

; John Wallis' formula for computing approximations to pi
(define (pi-term n)
  (if (even? n) (/ (+ n 2.0) (+ n 1.0))
      (/ (+ n 1.0) (+ n 2.0))))

; pi approximations using product procedure
(* (product pi-term 1 next 6) 4) ;= 3.343673469387755
(* (product pi-term 2 next 100) 4) ;= 4.735545264682747

; 1.32(a)
(define (accumulate combiner null-value term a next b)
  (if (> a b) null-value
  (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b) (accumulate + 0 term a next b))
(define (product term a next b) (accumulate * 1 term a next b))

; 1.40
(define (cubic a b c)
  (lambda (x) 
    (+ (cube x) 
       (* a (square x)) 
       (* b x) 
       c)))

; 1.41
(define (double f)
  (lambda (x)
    (f (f x))))

; 1.43
()