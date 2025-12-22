#lang racket

;Author: Anurag Muthyam

(provide trapezoid-area)
         
;; area of trapezoid
(define trapezoid-area
  (λ (a b h) (* 0.5 (+ a b) h)))
