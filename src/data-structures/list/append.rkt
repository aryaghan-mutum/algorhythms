#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide append-custom)

;; Concatenate two lists using natural recursion.
;; append-custom : list? list? -> list?
(define (append-custom lst1 lst2)
  (if (empty? lst1)
      lst2
      (cons (car lst1) (append-custom (cdr lst1) lst2))))

#|
;; Retired variants (iterative with reverse, letrec accumulator, variadic).
;; The recursive definition above was chosen for clarity; use the built-in
;; `append` when performance on very long lists matters.
|#
