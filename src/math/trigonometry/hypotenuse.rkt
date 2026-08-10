#lang racket

;; Author: Anurag Muthyam
;; Hypotenuse of a right triangle given its two legs.

(provide hypotenuse)

;; hypotenuse : number? number? -> number?
(define (hypotenuse a b) (sqrt (+ (sqr a) (sqr b))))
