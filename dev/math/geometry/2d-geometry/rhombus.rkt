#lang racket

;; Author: Anurag Muthyam

(provide rhombus-area 
         rhombus-perimeter)

;; area of rhombus
(define rhombus-area
  (λ (large-diag small-diag)
    (/ (* large-diag small-diag) 2)))

;; permiter of rhombus
(define rhombus-perimeter
  (λ (s) (* 4 s)))