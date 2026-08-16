#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide leap-year?)

;; #t when `year` is a Gregorian leap year (divisible by 4, but century years
;; must also be divisible by 400).
;; leap-year? : exact-integer? -> boolean?
(define (leap-year? year)
  (and (zero? (modulo year 4))
       (or (zero? (modulo year 400))
           (not (zero? (modulo year 100))))))
