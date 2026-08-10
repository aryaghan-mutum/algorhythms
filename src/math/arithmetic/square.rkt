#lang racket

;; Author: Anurag Muthyam
;; Square: Functions for squaring numbers

(provide square
         square-list
         sum-of-squares)

;; Squares a number (n²)
;; square : number? -> number?
(define (square n)
  (* n n))

;; Squares each element in a list
;; square-list : list? -> list?
(define (square-list lst)
  (map square lst))

;; Returns the sum of squares for all elements in a list
;; sum-of-squares : list? -> number?
(define (sum-of-squares lst)
  (apply + (square-list lst)))


