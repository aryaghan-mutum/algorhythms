#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide range-1-to-n)

;; Build a list of integers 1..n; returns '() when n <= 0.
;; range-1-to-n : exact-integer? -> (listof exact-positive-integer?)
(define (range-1-to-n n)
  (define (loop i acc)
    (if (<= i 0)
        acc
        (loop (sub1 i) (cons i acc))))
  (loop n null))
