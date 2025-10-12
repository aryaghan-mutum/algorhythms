#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum/racket-lists

(require rackunit)

(require "../lists/copy-tree.rkt")

(check-equal? (copy-tree '()) '())
(check-equal? (copy-tree '(a)) '(a))
(check-equal? (copy-tree '(a b)) '(a b))
(check-equal? (copy-tree '(a b 1 2)) '(a b 1 2))
(check-equal? (copy-tree '(a b '(1 2))) '(a b '(1 2)))
