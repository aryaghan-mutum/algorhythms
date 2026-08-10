#lang racket

;; Author: Anurag Muthyam
;; Minimum, maximum, and range of a list.

(provide minimum
         maximum
         range)

;; minimum : (listof number?) -> number?
(define (minimum lst) (apply min lst))

;; maximum : (listof number?) -> number?
(define (maximum lst) (apply max lst))

;; range : (listof number?) -> number? (maximum minus minimum)
(define (range lst) (- (maximum lst) (minimum lst)))
