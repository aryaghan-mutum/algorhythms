#lang racket

;; Author: Anurag Muthyam

(require rackunit)
(provide square-num
         square-map)

;; square a number
(define square-num
  (λ (n)
    (* n n)))

(define (square-num2 x)
  (if (not (number? x))
      (error "bad arguments")
      (* x x)))

;; square for each element in a list using map
(define square-map
  (λ (lst)
    (map square-num lst)))

;; Tests
(check-equal? (square-num 5) 25)
(check-equal? (square-map '(2 3 4)) '(4 9 16))
