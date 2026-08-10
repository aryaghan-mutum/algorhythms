#lang racket

;; Author: Anurag Muthyam
;; Time-value-of-money: future value and present value.

(require (only-in "interest.rkt" compound-interest))

(provide future-value
         present-value)

;; future-value : number? number? integer? -> number?
;; present-val compounded forward at rate over the given periods
(define (future-value present-val rate periods)
  (compound-interest present-val periods rate))

;; present-value : number? number? integer? -> number?
;; future-val discounted back at rate over the given periods
(define (present-value future-val rate periods)
  (/ future-val (expt (+ 1 rate) periods)))
