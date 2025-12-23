;; Author: Anurag Muthyam
;; flip - Function utilities

#lang racket

(provide flip
         constantly)

;; Flip the order of two arguments
;; ((flip -) 3 10) => (- 10 3) = 7
(define (flip fn)
  (lambda (x y)
    (fn y x)))

;; Returns a function that always returns the given value
;; ((constantly 42) 'anything) => 42
(define (constantly val)
  (lambda args val))
