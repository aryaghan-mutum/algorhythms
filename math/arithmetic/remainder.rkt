#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

(require threading rackunit racket/trace)
(provide custom-remainder)

;; Custom remainder implementation
(define (custom-remainder a b)
  (- a (* (floor (/ a b)) b)))

(check-eqv? (custom-remainder 10 3) 1)
(check-eqv? (custom-remainder 17 5) 2)
(check-eqv? (custom-remainder 25 7) 4)
