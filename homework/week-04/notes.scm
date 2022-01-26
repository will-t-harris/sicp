#lang simply-scheme
;; Rational number constructor
(define (make-rat n d)
  (let ((g ((if (< d 0) - +) (gcd n d))))
    (cons (/ n g) (/ d g))))

;; Rational number numerator selector
(define (numer x) (car x))

;; Rational number denominator selector
(define (denom x) (cdr x))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(make-rat 1 2) "should equal" '(1 . 2) (newline)
(make-rat -1 2) "should equal" '(-1 . 2) (newline)
(make-rat 1 -2) "should equal" '(-1 . 2) (newline)
(make-rat -1 -2) "should equal" '(1 . 2) (newline)