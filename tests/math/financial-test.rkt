#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require rackunit
         rackunit/text-ui
         "../../src/math/financial/interest.rkt"
         "../../src/math/financial/time-value.rkt"
         "../../src/math/financial/investment-return.rkt"
         "../../src/math/financial/npv.rkt")

(define financial-tests
  (test-suite
   "financial"

   (test-suite
    "interest/time-value - valid"
    (test-case "simple-interest computes P*(1+rt)" (check-equal? (simple-interest 1000 2 0.05) 1100.0))
    (test-case "compound-interest computes P*(1+r)^t" (check-equal? (compound-interest 1000 2 0.05) 1102.5))
    (test-case "future-value matches compound-interest" (check-equal? (future-value 1000 0.05 2) 1102.5))
    (test-case "present-value round-trips future-value" (check-equal? (present-value 1102.5 0.05 2) 1000.0)))

   (test-suite
    "investment-return/npv - valid"
    (test-case "roi as a gain/cost ratio" (check-equal? (roi 1200 1000) 1/5))
    (test-case "emi for a fixed principal/rate/term" (check-within (emi 100000 0.01 12) 8884.88 0.01))
    (test-case "npv of a positive-return cashflow series" (check-within (npv 0.1 '(-1000 400 400 400 400)) 267.95 0.01))
    (test-case "irr of the same cashflow series" (check-within (irr '(-1000 400 400 400 400)) 0.2186 0.001)))

   (test-suite
    "interest/time-value - edge"
    (test-case "simple-interest with 0 rate returns the principal" (check-equal? (simple-interest 500 3 0) 500))
    (test-case "compound-interest with 0 time returns the principal" (check-equal? (compound-interest 500 0 0.05) 500)))))

(run-tests financial-tests)
