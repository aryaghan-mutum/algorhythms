;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#lang racket
(require rackunit racket/trace)
(provide transpose)

;; =================

(define (transpose lst)
  (list (map car lst) (map cdr lst)))

;; =================

(check-equal? (transpose '((a . 1) (b . 2) (c . 3))) '((a b c) (1 2 3)))
