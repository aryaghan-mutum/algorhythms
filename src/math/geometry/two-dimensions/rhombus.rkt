#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide rhombus-area
         rhombus-perimeter)

;; Area of a rhombus from its two diagonals: (d1 * d2) / 2.
;; rhombus-area : real? real? -> real?
(define (rhombus-area large-diag small-diag)
  (/ (* large-diag small-diag) 2))

;; Perimeter of a rhombus with side length s: 4 s.
;; rhombus-perimeter : real? -> real?
(define (rhombus-perimeter s) (* 4 s))