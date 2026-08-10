#lang racket

;; Author: Anurag Muthyam
;; Return on investment and equated monthly installment.

(provide roi
         emi)

;; roi : number? number? -> number? (return on investment, as a ratio)
(define (roi gain cost)
  (/ (- gain cost) cost))

;; emi : number? number? integer? -> number? (principal, monthly-rate, months)
(define (emi principal monthly-rate months)
  (define factor (expt (+ 1 monthly-rate) months))
  (/ (* principal monthly-rate factor) (- factor 1)))
