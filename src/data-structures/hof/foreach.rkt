;; Author: Anurag Muthyam
;; foreach - Apply function to each element

#lang racket

(provide foreach)

;; Apply fn to each element, returning the new list (non-mutating).
;; foreach : (any/c -> any/c) list? -> list?
(define (foreach fn lst)
  (if (empty? lst)
      '()
      (cons (fn (car lst)) (foreach fn (cdr lst)))))
