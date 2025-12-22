;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket

(require threading racket/trace rackunit)
(provide even-v1?
         odd-v1?
         even-v2?
         odd-v2?
         even-v3?
         odd-v3?
         even-v4?
         odd-v4?)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; checks if a number is even (easiest way!) version 1
(define (even-v1? n)
  (zero? (remainder n 2)))

;; checks if a number is odd (easiest way!) version 1
(define (odd-v1? n)
  (not (zero? (remainder n 2))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; checks if a number is even version 2
(define (even-v2? n)
  (if (= (remainder n 2) 0) #t #f))

;; checks if a number is odd version 2
(define (odd-v2? n)
  (not (even-v2? n)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; checks if a number is even version 3
(define (even-v3? n)
  (not (odd-v3? n)))

;; checks if a number is odd version 3
(define (odd-v3? n)
  (not (= (remainder n 2) 0)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; checks if a number is even version 4
;; even-v4? and odd-v4 doesn't work for negative numbers
(define (even-v4? n)
  (or (zero? n)
      (odd-v4? (sub1 n))))

;; checks if a number is odd  version 4
;; even-v4? and odd-v4 doesn't work for negative numbers
(define (odd-v4? n)
  (and (not (zero? n))
      (even-v4? (sub1 n))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-true (even-v1? 0))
(check-true (even-v1? 2))
(check-false (even-v1? 1))

(check-true (odd-v1? 1))
(check-false (odd-v1? 0))
(check-false (odd-v1? 2))

(check-true (even-v2? 0))
(check-true (even-v2? 2))
(check-false (even-v2? 1))

(check-true (odd-v2? 1))
(check-false (odd-v2? 0))
(check-false (odd-v2? 2))

(check-true (even-v3? 0))
(check-true (even-v3? 2))
(check-false (even-v3? 1))

(check-true (odd-v3? 1))
(check-false (odd-v3? 0))
(check-false (odd-v3? 2))

(check-true (even-v4? 0))
(check-true (even-v4? 2))
(check-false (even-v4? 1))

(check-true (odd-v4? 1))
(check-false (odd-v4? 0))
(check-false (odd-v4? 2))
