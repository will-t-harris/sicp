(define x '(1 3 (5 7 9)))
(car (cdr (car (cdr (cdr x))))) "should equal" 7 (newline)

(define x2 '((7)))
(car (car x2)) "should equal" 7 (newline)

(define x3 '(1 (2 (3 (4 (5 (6 7)))))))
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr x3)))))))))))) "should equal" 7 (newline)