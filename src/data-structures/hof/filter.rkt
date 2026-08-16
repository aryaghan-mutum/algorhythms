;; Author: Anurag Muthyam
;; filter - Filter elements from a list based on predicate

#lang racket

(provide filter-custom)

;; Keep only elements of lst that satisfy predicate fn.
;; filter-custom : (any/c -> boolean?) list? -> list?
(define (filter-custom fn lst)
  (cond ((empty? lst) '())
        ((fn (car lst)) (cons (car lst) (filter-custom fn (cdr lst))))
        (else (filter-custom fn (cdr lst)))))