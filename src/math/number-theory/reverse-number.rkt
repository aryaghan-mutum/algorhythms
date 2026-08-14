#lang racket

;; Author: Anurag Muthyam
;; Reverse the decimal digits of a number.

(require (only-in "digit-conversion.rkt" integer->digit-list digit-list->integer)
         (only-in "../arithmetic/abs.rkt" absolute))

(provide reverse-number)

;; reverse-number : integer? -> integer?
(define (reverse-number n)
  (digit-list->integer (reverse (integer->digit-list (absolute n)))))
