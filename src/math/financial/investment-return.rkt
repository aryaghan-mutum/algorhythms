#lang racket

;; Author: Anurag Muthyam
;; Return on investment and equated monthly installment.

(provide roi
         emi)

;; roi : number? number? -> number? (return on investment, as a ratio)
(define (roi gain cost)
  (/ (- gain cost) cost))

;; emi : number? number? integer? -> number? (principal, monthly-rate, months)
;; at monthly-rate = 0 the standard formula divides by zero; the well-defined limit
;; there is a plain equal split of the principal over the term, so that case is special-cased
(define (emi principal monthly-rate months)
  (if (zero? monthly-rate)
      (/ principal months)
      (let ([factor (expt (+ 1 monthly-rate) months)])
        (/ (* principal monthly-rate factor) (- factor 1)))))
