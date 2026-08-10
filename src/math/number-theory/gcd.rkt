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

;; using recursion and remainder version 1
(define (gcd-v1 a b)
   (if (zero? b)
       a
       (gcd-v1 b (remainder a b))))

;; using recursion and modulo version 2
(define (gcd-v2 a b)
   (if (= b 0)
       a
       (gcd-v2 b (modulo a b))))

;; using iteration version 3
(define (gcd-v3 a b)
  (if (zero? (modulo (max a b) (min a b)))
      (min a b)
      (gcd-v3 (min a b)
              (modulo (max a b) (min a b)))))