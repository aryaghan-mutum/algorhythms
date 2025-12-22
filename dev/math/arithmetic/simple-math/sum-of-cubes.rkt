#lang racket

;; Author: Anurag Muthyam
;; Sum of Cubes

(define (sum-of-cubes c1 c2)
  (define (cube n) (* n n n))
  (define (sum c1 c2) (+ c1 c2))
  (sum (cube c1) (cube c2)))

(sum-of-cubes 2 3)