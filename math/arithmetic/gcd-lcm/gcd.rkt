#lang racket

;; finding GCD for decimal values
(require rnrs/base-6)
(mod 370.24 450)

;;Author: Anurag Muthyam
;;find Greatest Common Divisor(GCD) or Greatest Common Factor(GCF)
;; gcd(a b) = gcd(b r), where r is remainder

;Method 1:
(define (gcd a b)
   (if (zero? b)
       a
       (gcd b (remainder a b))))

(gcd 2 10)

;Method 2:
(define (gcd-2 a b)
   (if (= b 0)
       a
       (gcd b (modulo a b))))

(gcd-2 2 10)


;Method 3:
(define (gcd-3 a b)
  (if (zero? (modulo (max a b) (min a b)))
      (min a b)
      (gcd-3 (min a b) (modulo (max a b) (min a b)))
  ))

(gcd-3 2 10)

;; reaminder procedure
(define (reaminder a b)
  (- a (* (floor (/ a b) b))))



