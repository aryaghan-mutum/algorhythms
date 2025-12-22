;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum/

;; Author: Anurag Muthyam
;; find Greatest Common Divisor(GCD) or Greatest Common Factor(GCF)
;; gcd(a b) = gcd(b r), where r is remainder

#lang racket
(require rnrs/base-6 rackunit)
(provide gcd-v1 gcd-v2 gcd-v3 lcm-v1)

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

;; least common multiple for two numbers version 1
(define (lcm-v1 a b)
  (/ (* a b) (gcd a b)))

(check-eqv? (gcd 2 10) 2)
(check-eqv? (gcd 180 270) 90)

(check-eqv? (gcd-v1 2 10) 2)
(check-eqv? (gcd-v1 180 270) 90)

(check-eqv? (gcd-v2 2 10) 2)
(check-eqv? (gcd-v2 180 270) 90)

(check-eqv? (gcd-v3 2 10) 2)
(check-eqv? (gcd-v3 180 270) 90)

(check-eqv? (lcm-v1 2 10) 10)
(check-eqv? (lcm-v1 32 46) 736)
