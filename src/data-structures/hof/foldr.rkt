;; Author: Anurag Muthyam
;; foldr - Right fold implementation

#lang racket

(provide foldr-custom)

;; Right fold: reduce lst right-to-left threading the accumulator through fn.
;; foldr-custom : (any/c any/c -> any/c) any/c list? -> any/c
(define (foldr-custom fn init lst)
  (if (empty? lst)
      init
      (fn (car lst) (foldr-custom fn init (cdr lst)))))