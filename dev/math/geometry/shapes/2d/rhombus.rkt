#lang racket

;; Author: Anurag Muthyam

(require rackunit)
(provide rhombus-area
         rhombus-perimeter)

;; area of rhombus
(define rhombus-area
  (λ (large-diag small-diag)
    (/ (* large-diag small-diag) 2)))

;; perimeter of rhombus
(define rhombus-perimeter
  (λ (s) (* 4 s)))

;; Tests
(check-equal? (rhombus-area 10 8) 40)
(check-equal? (rhombus-perimeter 5) 20)
