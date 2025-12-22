;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require rackunit)
(provide set-union)

;; get a set of elements by joinng two lists (union)
(define (set-union lstx lsty)
  (remove-duplicates (append lstx lsty)))

;; unit tests:

(check-equal? (set-union '() '()) '())
(check-equal? (set-union '(1) '()) '(1))
(check-equal? (set-union '(1 2 a b) '(3 4 a b c 6)) '(1 2 a b 3 4 c 6))
(check-equal? (set-union '(1 2 3 1) '(3 4 5 5 6)) '(1 2 3 4 5 6))
