#lang racket

;; Author: Anurag Muthyam
;; Basic binary arithmetic operators.

(provide add
         subtract
         multiply
         divide
         modulus)

;; add : number? number? -> number?
(define (add a b) (+ a b))

;; subtract : number? number? -> number?
(define (subtract a b) (- a b))

;; multiply : number? number? -> number?
(define (multiply a b) (* a b))

;; divide : number? number? -> number?
(define (divide a b) (/ a b))

;; modulus : integer? integer? -> integer?
(define (modulus a b) (modulo a b))
