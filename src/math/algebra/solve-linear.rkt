#lang racket

;; Author: Anurag Muthyam
;; Solve a linear equation ax + b = 0 for x.

(provide solve-linear)

;; solve-linear : number? number? -> number?
(define (solve-linear a b)
  (- (/ b a)))
