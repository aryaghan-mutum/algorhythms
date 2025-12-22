#lang racket

;'list tail

(define list-tail
  (lambda (ls n)
    (if (= n 0)
        ls
        (list-tail (cdr ls) (- n 1))))) 

(list-tail '(a b c) 0) 
(list-tail '(a b c) 2) 
(list-tail '(a b c) 3) 
(list-tail '(a b c . d) 2) 
(list-tail '(a b c . d) 3) 
(let ((x (list 1 2 3)))
  (eq? (list-tail x 2)
       (cddr x))) 