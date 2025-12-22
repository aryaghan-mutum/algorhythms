#lang racket

;; Author: Anurag Muthyam
;; Decrement: Functions for subtracting 1 from numbers

(provide decrement
         decrement-list)

;; Decrements a number by 1
;; decrement : number? -> number?
(define (decrement n)
  (- n 1))

;; Decrements each element in a list by 1
;; decrement-list : list? -> list?
(define (decrement-list lst)
  (map decrement lst))