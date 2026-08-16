;; Author: Anurag Muthyam
;; foldl - Left fold implementation

#lang racket

(provide foldl-custom)

;; Left fold: reduce lst left-to-right threading the accumulator through fn.
;; foldl-custom : (any/c any/c -> any/c) any/c list? -> any/c
(define (foldl-custom fn init lst)
  (if (empty? lst)
      init
      (foldl-custom fn (fn init (car lst)) (cdr lst))))
