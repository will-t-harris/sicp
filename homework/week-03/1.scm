#lang simply-scheme

; Helper procedures
(define (square x) (* x x))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

; 1.16
(define (iter-fast-exp base n)
  (define (iter N B A)
    (cond ((= 0 N) A)
          ((even? N) (iter (/ N 2) (square B) A))
          (else (iter (- N 1) B (* B A)))))
  (iter n base 1))

; 1.35
(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)

; 1.37
; Resursive (a)
(define (cont-frac-rec n d k)
  (define (rec x)
    (if (> x k)
        0
        (/ n x (+ (d x) (rec (+ x 1))))))
  (rec 1))

; Iterative (b)
(define (cont-frac-iter n d k)
  (define (iter x result)
    (if (= x 0)
        result
        (iter (- x 1) (/ (n x) (+ (d x) result)))))
  (iter k 0))