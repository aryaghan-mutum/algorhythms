#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum/racket-lists

(provide reverse
         reverse-without-duplicates)

(require "../lists/higher-order-procs.rkt")

;; reverse a list
(define (reverse lst)
  (define (reverse-iter lst rlst)
    (if (empty? lst)
        rlst
        (reverse-iter (cdr lst)
                      (cons (car lst) rlst))))
  (reverse-iter lst '()))

;; reverse the list by eleminating duplicate items
(define (reverse-without-duplicates lst)
  (define (rev-aux lst lst2)
    (if (empty? lst)
        (remove-duplicates (flatmap lst2))
        (rev-aux (cdr lst)
                 (cons (car lst) lst2))))
  (rev-aux lst '()))
