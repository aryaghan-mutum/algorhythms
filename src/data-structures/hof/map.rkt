;; Author: Anurag Muthyam
;; map - Apply function to each element in a list

#lang racket

(provide mapper)

;; Apply fn to each element and return new list.
;; mapper : (any/c -> any/c) list? -> list?
(define (mapper fn lst)
  (if (empty? lst)
      '()
      (cons (fn (car lst)) (mapper fn (cdr lst)))))