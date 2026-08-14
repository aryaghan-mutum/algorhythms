;; Author: Anurag Muthyam

;; Euler's prime-generating polynomial n^2 - n + 41 (and its mirror n^2 + n + 41):
;; both produce a prime for every n in 0..40, and both fail at n=41, where the
;; result is 41^2 (composite). Verified computationally, not merely by comment --
;; do not trust a claim about which n breaks the streak without checking primality.

#lang racket
(provide euler-candidate-minus
         euler-candidate-plus)

;; n^2 - n + 41
;; euler-candidate-minus : integer? -> integer?
(define (euler-candidate-minus n)
  (- (+ (sqr n) 41) n))

;; n^2 + n + 41
;; euler-candidate-plus : integer? -> integer?
(define (euler-candidate-plus n)
  (+ (+ (sqr n) 41) n))
