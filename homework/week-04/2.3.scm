#lang simply-scheme
;; 2.3

;; Point 
(define (make-point x y) (cons x y)) 
(define (x-point p) (car p)) 
(define (y-point p) (cdr p))

;; Rectangle constructor
(define (make-rectangle bottom-left top-right)
  (cons bottom-left top-right))

;; Rectangle points selectors
(define (bottom-left rect)
  (car rect))
(define (top-right rect)
  (cdr rect))
(define (top-left rect)
  (make-point (x-point (car rect))
              (y-point (cdr rect))))
(define (bottom-right rect)
  (make-point (x-point (cdr rect))
              (y-point (car rect))))

;; Rectangle width/height selectors
;; Take the absolute value of the difference to find the distance between points
(define (width-rect rect)
  (abs (- (x-point (bottom-left rect))
          (x-point (bottom-right rect)))))

(define (height-rect rect)
  (abs (- (y-point (bottom-left rect))
          (y-point (top-left rect)))))

;; "Public" selectors
(define (area-rect rect)
  (* (width-rect rect) (height-rect rect)))

(define (perimeter-rect rect)
  (* (+ (width-rect rect) (height-rect rect)) 2))

;; Tests
(make-rectangle '(1 . 2) '(3 . 6)) "should equal" '((1 . 2) 3 . 6) (newline)

(top-left '((1 . 2) 3 . 6)) "should equal" '(1 . 6) (newline)
(bottom-left '((1 . 2) 3 . 6)) "should equal" '(1 . 2) (newline)
(top-right '((1 . 2) 3 . 6)) "should equal" '(3 . 6) (newline)
(bottom-right '((1 . 2) 3 . 6)) "should equal" '(3 . 2) (newline)

(width-rect '((1 . 2) 3 . 6)) "should equal" 2 (newline)
(height-rect '((1 . 2) 3 . 6)) "should equal" 4 (newline)

(area-rect '((1 . 2) 3 . 6)) "should equal" 8 (newline)
(perimeter-rect '((1 . 2) 3 . 6)) "should equal" 12 (newline)
