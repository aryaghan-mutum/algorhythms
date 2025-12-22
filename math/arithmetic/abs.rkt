#lang racket

;; Author: Anurag Muthyam
;; Absolute Value: Functions for computing absolute values

(provide absolute
         absolute-list)

;; Returns the absolute value of a number
;; absolute : number? -> number?
(define (absolute n)
  (if (< n 0) (- n) n))

;; Returns absolute values for each element in a list
;; absolute-list : list? -> list?
(define (absolute-list lst)
  (map absolute lst))
