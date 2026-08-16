#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide copy-list)

;; Return a fresh list with the same elements as `lst` (structure-preserving, flat).
;; copy-list : list? -> list?
(define (copy-list lst)
  (define (loop lst acc)
    (if (empty? lst)
        (reverse acc)
        (loop (cdr lst) (cons (car lst) acc))))
  (loop lst '()))
