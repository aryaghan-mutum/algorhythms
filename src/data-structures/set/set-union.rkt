#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide set-union)

;; Return the union of two lists as a set (duplicates removed, order not guaranteed).
;; set-union : list? list? -> list?
(define (set-union lstx lsty)
  (remove-duplicates (append lstx lsty)))
