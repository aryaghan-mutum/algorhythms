;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum
;; Pythagoras formula

#lang racket
(require rackunit)
(provide pythagoras)

;; baudhayana/pythagoras formula
(define (pythagoras x y)
  (sqrt (+ (sqr x) (sqr y))))

(check-eqv? (pythagoras 5 12) 13)
