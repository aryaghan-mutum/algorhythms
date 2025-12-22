#lang racket

;; Author: Anurag Muthyam
;; Double: Functions for doubling numbers and lists

(provide double
         double-list)

;; Doubles a number
;; double : number? -> number?
(define (double n)
  (* n 2))

;; Doubles each element in a list
;; double-list : list? -> list?
(define (double-list lst)
  (map double lst))

