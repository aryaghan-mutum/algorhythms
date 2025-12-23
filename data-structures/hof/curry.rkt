;; Author: Anurag Muthyam
;; curry - Currying and partial application

#lang racket

(provide curry2
         partial)

;; Curry a 2-argument function
;; ((curry2 +) 1) returns a function that adds 1
(define (curry2 fn)
  (lambda (x)
    (lambda (y)
      (fn x y))))

;; Partial application - fix some arguments
;; ((partial + 1 2) 3 4) => (+ 1 2 3 4) = 10
(define (partial fn . args)
  (lambda rest
    (apply fn (append args rest))))
