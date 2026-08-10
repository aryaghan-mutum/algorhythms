;; Author: Anurag Muthyam

#lang racket

(require racket/contract)

(provide
  (contract-out
    [factorial (-> exact-nonnegative-integer? exact-nonnegative-integer?)]))

;; Calculates the factorial of n
;; factorial : natural? -> natural?
;; Example: (factorial 5) => 120
(define (factorial n)
  (if (<= n 1) 
      1 
      (* n (factorial (- n 1)))))