#lang racket

;; Author: Anurag Muthyam
;; Least Common Multiple (LCM)

(provide lcm-custom)

;; LCM using GCD: lcm(a, b) = (a * b) / gcd(a, b)
(define (lcm-custom a b)
  (/ (* a b) (gcd a b)))
