#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum/racket-lists

(provide squares)

;; square all the numbers in a list based on the limit using iteratve approach and range
(define (squares n)
  (define (squares-iter lst rlst)
    (if (empty? lst)
        (reverse rlst)
        (squares-iter (cdr lst)
                      (cons (sqr (car lst)) rlst))))
    (squares-iter (range n) '()))
