#lang racket

;; Author: Anurag Muthyam
;; Greatest Common Divisor (GCD) / Greatest Common Factor (GCF)

(provide gcd-custom
         gcd-euclidean)

;; Euclidean algorithm: gcd(a, b) = gcd(b, r) where r = a mod b
(define (gcd-custom a b)
  (if (zero? b)
      a
      (gcd-custom b (remainder a b))))

;; Alternative using modulo
(define (gcd-euclidean a b)
  (if (zero? b)
      a
      (gcd-euclidean b (modulo a b))))
