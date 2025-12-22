;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require rackunit threading)
(provide identity)

;; =================

(define (identity x) x)

;; =================

(check-equal? (identity '()) '())
(check-equal? (identity '(a 1 2)) '(a 1 2))
(check-equal? (identity 23) 23)
(check-equal? (identity 'a) 'a)
(check-equal? (identity "lisp") "lisp")
