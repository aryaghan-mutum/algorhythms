#lang racket

;; lcm procedure
(define (lcm! a b)
  (/ (* a b)
     (gcd a b)))

(lcm! 1/2 2/3)

(gcd 9 15 24)  ;1080
(lcm 9 15 24)  ;1080

(lcm 24)  ;1080

