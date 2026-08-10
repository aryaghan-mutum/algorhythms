#lang racket

;; Author: Anurag Muthyam
;; Core arithmetic operations: add, subtract, multiply, divide, modulus,
;; square, cube, power, sqrt, absolute, percentage, average.

(require (only-in "arithmetic/square.rkt" square)
         (only-in "arithmetic/cube.rkt" cube)
         (only-in "arithmetic/abs.rkt" absolute))

(provide add
         subtract
         multiply
         divide
         modulus
         square
         cube
         power
         sqrt
         absolute
         percentage
         average)

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

;; power : number? number? -> number? (raises base to exponent)
(define power expt)

;; average : (listof number?) -> number? (arithmetic mean of a list)
(define (average lst)
  (/ (apply + lst) (length lst)))

;; percentage : number? number? -> number? (part as a percentage of whole)
(define (percentage part whole)
  (* 100 (/ part whole)))
