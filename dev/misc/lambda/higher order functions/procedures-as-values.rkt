#lang racket


;; regular function returns a number
(define (func x y)
  (+ x y))

(func 2 3) ;result: 5 


; return a function 
(define (func2 x y)
  (lambda (x y)
    (+ x y)))

(func2 2 3) ;result: #<procedure>

;; taken from SICP page 1st chp 1.3.4
(define (average-damp f)
 (lambda (x) (average x (f x))))

(define (average x y) (/ (+ x y) 2))

((average-damp sqr) 10)