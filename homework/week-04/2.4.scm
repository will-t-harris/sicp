#lang simply-scheme
(define (cons a b) (lambda (m) (m a b)))
(define (car z) (z (lambda (p q) p)))
(define (cdr z) (z (lambda (p q) q)))