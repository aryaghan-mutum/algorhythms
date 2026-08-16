;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#lang racket

(provide custom-remainder)

;; Remainder of a/b via floor(a/b) (matches Racket's `remainder` for positive a,b).
;; custom-remainder : real? (and/c real? (not/c zero?)) -> real?
(define (custom-remainder a b)
  (- a (* (floor (/ a b)) b)))