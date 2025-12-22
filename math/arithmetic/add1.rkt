#lang racket

;; Author: Anurag Muthyam
;; Increment: Functions for adding 1 to numbers

(provide increment
         increment-list)

;; Increments a number by 1
;; increment : number? -> number?
(define (increment n)
  (+ n 1))

;; Increments each element in a list by 1
;; increment-list : list? -> list?
(define (increment-list lst)
  (map increment lst))

