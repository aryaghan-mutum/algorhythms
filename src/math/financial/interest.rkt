#lang racket

;; Author: Anurag Muthyam
;; Simple and compound interest.

(provide simple-interest
         compound-interest)

;; simple-interest : number? number? number? -> number? (principal, time, rate)
(define simple-interest
  (lambda (principal time interest-rate)
    (* principal (+ 1 (* interest-rate time)))))

;; compound-interest : number? number? number? -> number? (principal, time, rate)
(define compound-interest
  (lambda (principal time interest-rate)
    (* principal
       (expt (+ 1 interest-rate) time))))
