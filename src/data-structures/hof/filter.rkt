;; Author: Anurag Muthyam
;; filter - Filter elements from a list based on predicate

#lang racket

(provide filter-custom)

;; Filter elements that satisfy predicate fn
;; (filter-custom even? '(1 2 3 4 5 6)) => '(2 4 6)
(define (filter-custom fn lst)
  (cond ((empty? lst) '())
        ((fn (car lst)) (cons (car lst) (filter-custom fn (cdr lst))))
        (else (filter-custom fn (cdr lst)))))