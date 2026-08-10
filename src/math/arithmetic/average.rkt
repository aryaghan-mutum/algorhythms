#lang racket

;; Author: Anurag Muthyam
;; Average: arithmetic mean of a list of numbers.

(provide average)

;; average : (listof number?) -> number?
(define (average lst)
  (/ (apply + lst) (length lst)))
