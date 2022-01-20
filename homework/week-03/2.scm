#lang simply-scheme
; requires that (= n (+ 1 i))
(define (sum-of-factors n i)
  (cond ((= i 1) 1)
        ((= (remainder n i) 0) (+ i (sum-of-factors n (- i 1))))
        (else (sum-of-factors n (- i 1)))))

(define (next-perf-num n)
  (let ((current-sum (sum-of-factors n (- n 1))))
    (cond ((= current-sum n) n)
          (else (next-perf-num (+ n 1))))))
    