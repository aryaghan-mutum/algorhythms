;; Author: Anurag Muthyam

#lang racket

(require rackunit)
(provide leap?
         expression?)

;; check if x is an expression (number, symbol, or pair)
(define (expression? x)
  (or (number? x) (symbol? x) (pair? x)))

;; check if a given year is a leap year
(define (leap? year)
  (and (zero? (modulo year 4))
       (or (zero? (modulo year 400))
           (not (zero? (modulo year 100))))))
