#lang racket

;; Author: Anurag Muthyam

;; Generate and verify Pythagorean triplets

(provide pythagorean-triplets
         pythagorean-triple?)

;; all Pythagorean triplets (x y z) with x < y < z < limit
;; pythagorean-triplets : integer? -> (listof (list integer? integer? integer?))
(define (pythagorean-triplets limit)
  (for*/list ((x (in-range 1 limit))
              (y (in-range x limit))
              (z (in-range y limit))
              #:when (= (+ (sqr x) (sqr y)) (sqr z)))
    (list x y z)))

;; verify x^2 + y^2 = z^2 via the baudhayana/pythagoras area-decomposition proof
;; pythagorean-triple? : real? real? real? -> boolean?
(define (pythagorean-triple? x y z)
  (define (area-of-outer-sqr) (+ (sqr x) (* 2 x y) (sqr y)))
  (define (area-of-inner-sqr) (+ (area-of-four-triangles x y) (sqr z)))
  (define (area-of-four-triangles b h) (/ (* 4 b h) 2))
  (= (area-of-outer-sqr) (area-of-inner-sqr)))
