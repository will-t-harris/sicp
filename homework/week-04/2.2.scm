#lang simply-scheme
;; 2.2

;; Constructors
(define (make-point x y)
  (cons x y))
(define (make-segment p1 p2)
  (cons p1 p2))

;; Selectors
(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))

(define (start-segment s)
  (car s))
(define (end-segment s)
  (cdr s))

;; Print procedure
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (midpoint-segment s)
  (cons
   (/ (+ (x-point (start-segment s)) (x-point (end-segment s))) 2)
   (/ (+ (y-point (start-segment s)) (y-point (end-segment s))) 2)))


"make-point tests"
(make-point 1 2) "should equal" '(1 . 2) (newline)
(x-point '(1 . 2)) "should equal" 1 (newline)
(y-point '(1 . 2)) "should equal" 2 (newline)
(newline)

"make-segment tests"
(make-segment (make-point 1 2) (make-point 4 5)) "should equal" '((1 . 2) 4 . 5) (newline)
(start-segment '((1 . 2) 4 . 5)) "should equal" '(1 . 2) (newline)
(end-segment '((1 . 2) 4 . 5)) "should equal" '(4 . 5) (newline)

"midpoint-segment tests"
(midpoint-segment '((-2 . -4) 6 . 4)) "should equal" '(2 . 0) (newline)