#lang racket

;; Author: Anurag Muthyam
;; Reverse the decimal digits of a number.

(require (only-in "palindrome-num.rkt" int->list-helper list->int-helper)
         (only-in "../arithmetic/abs.rkt" absolute))

(provide reverse-number)

;; reverse-number : integer? -> integer?
(define (reverse-number n)
  (list->int-helper (reverse (int->list-helper (absolute n)))))
