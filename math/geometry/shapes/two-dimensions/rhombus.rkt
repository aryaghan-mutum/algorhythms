#lang racket

;; Author: Anurag Muthyam

(provide rhombus-area
         rhombus-perimeter)

;; area of rhombus
(define rhombus-area
  (lambda (large-diag small-diag)
    (/ (* large-diag small-diag) 2)))

;; perimeter of rhombus
(define rhombus-perimeter
  (lambda (s) (* 4 s)))