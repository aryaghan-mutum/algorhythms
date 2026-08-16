#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide nth)

;; Get the element at 1-indexed position `pos` in `lst`; error if out of range.
;; nth : list? exact-positive-integer? -> any/c
(define (nth lst pos)
  (define (loop lst count)
    (cond ((empty? lst) (error 'nth "index out of bounds"))
          ((= count pos) (car lst))
          (else (loop (cdr lst) (add1 count)))))
  (loop lst 1))
