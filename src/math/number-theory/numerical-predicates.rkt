;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#lang racket
(provide zero-num?
         one?
         non-negative-num?
         negative-num?
         even-num?
         odd-num?
         square?
         even?
         odd?)

;; check if a number is 0
;; zero-num? : real? -> boolean?
(define (zero-num? n) (= n 0))

;; check if a number is 1
;; one? : real? -> boolean?
(define (one? n) (= n 1))

;; check if a number is 0 or greater
;; non-negative-num? : real? -> boolean?
(define (non-negative-num? n) (>= n 0))

;; check if a number is strictly less than 0
;; negative-num? : real? -> boolean?
(define (negative-num? n) (< n 0))

;; check if a number is even
;; even-num? : integer? -> boolean?
(define (even-num? n) (zero-num? (remainder n 2)))

;; checks if a number is odd
;; odd-num? : integer? -> boolean?
(define (odd-num? n) (not (zero-num? (remainder n 2))))

;; check if a number is a perfect square
;; square? : real? -> boolean?
(define (square? n) (and (non-negative-num? n) (integer? (sqrt n))))
