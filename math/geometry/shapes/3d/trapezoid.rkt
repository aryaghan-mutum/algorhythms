#lang racket

;; Author: Anurag Muthyam

(require rackunit)
(provide trapezoid-area)

;; area of trapezoid
(define trapezoid-area
  (λ (a b h) (* 0.5 (+ a b) h)))

;; Tests
(check-equal? (trapezoid-area 4 6 5) 25.0)
