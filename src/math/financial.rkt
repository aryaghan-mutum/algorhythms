#lang racket

;; Author: Anurag Muthyam
;; Financial mathematics: interest, return on investment, loan
;; installments, and time-value-of-money calculations.

(require (only-in "arithmetic/sequences.rkt" simple-interest compound-interest))

(provide simple-interest
         compound-interest
         roi
         emi
         future-value
         present-value
         npv
         irr)

;; roi : number? number? -> number? (return on investment, as a ratio)
;; roi : (gain - cost) / cost
(define (roi gain cost)
  (/ (- gain cost) cost))

;; emi : number? number? integer? -> number?
;; equated monthly installment: principal, monthly-rate, number-of-months
(define (emi principal monthly-rate months)
  (define factor (expt (+ 1 monthly-rate) months))
  (/ (* principal monthly-rate factor) (- factor 1)))

;; future-value : number? number? integer? -> number?
;; present-value compounded forward at rate over the given periods
(define (future-value present-val rate periods)
  (compound-interest present-val periods rate))

;; present-value : number? number? integer? -> number?
;; future-value discounted back at rate over the given periods
(define (present-value future-val rate periods)
  (/ future-val (expt (+ 1 rate) periods)))

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
