#lang racket

;; Author: Anurag Muthyam

(provide square
         square-map)

;; square a number
(define square
  (lambda (n)
    (* n n)))

(define (square2 x)
  (if (not (number? x))
      (error "bad arguments")
      (* x x)))

;; cube for each element in a list using map
(define square-map
  (lambda (lst)
    (map square lst)))


