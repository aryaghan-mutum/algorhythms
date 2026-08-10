#lang racket

;; Author: Anurag Muthyam
;; Net present value and internal rate of return.

(require (only-in "time-value.rkt" present-value))

(provide npv
         irr)

;; npv : number? (listof number?) -> number?
;; net present value of a series of cash flows, cashflows[0] is the period-0 flow
(define (npv rate cashflows)
  (for/sum ([cashflow (in-list cashflows)]
            [t (in-naturals)])
    (present-value cashflow rate t)))

;; irr : (listof number?) -> number?
;; internal rate of return: the rate for which (npv rate cashflows) is 0,
;; found via bisection over the range (-0.99, 10), assuming a sign change
(define (irr cashflows)
  (define (npv-at r) (npv r cashflows))
  (let loop ([lo -0.99] [hi 10.0] [iterations 100])
    (define mid (/ (+ lo hi) 2))
    (cond [(zero? iterations) mid]
          [(> (* (npv-at lo) (npv-at mid)) 0) (loop mid hi (sub1 iterations))]
          [else (loop lo mid (sub1 iterations))])))
