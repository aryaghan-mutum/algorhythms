#lang racket

;; Author: Anurag Muthyam

;; Generate Pythagorean triplets

(provide pythagorean-triplets)

;; all Pythagorean triplets (x y z) with x < y < z < limit
(define (pythagorean-triplets limit)
  (for*/list ((x (in-range 1 limit))
              (y (in-range x limit))
              (z (in-range y limit))
              #:when (= (+ (sqr x) (sqr y)) (sqr z)))
    (list x y z)))
