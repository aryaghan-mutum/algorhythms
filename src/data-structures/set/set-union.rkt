;; Author: Anurag Muthyam

#lang racket
(require rackunit)
(provide set-union)

;; get a set of elements by joinng two lists (union)
(define (set-union lstx lsty)
  (remove-duplicates (append lstx lsty)))
