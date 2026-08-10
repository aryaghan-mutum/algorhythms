#lang racket

;; Author: Anurag Muthyam

(provide squares)

;; Generates a list of squares 0² through (n-1)²
(define (squares n)
  (define (loop i)
    (if (= i n)
        null
        (cons (* i i) (loop (add1 i)))))
  (loop 0))
