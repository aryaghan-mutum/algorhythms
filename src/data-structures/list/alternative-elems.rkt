#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide alternative-elems)

;; Return every other element of `lst`, starting with the first.
;; alternative-elems : list? -> list?
(define (alternative-elems lst)
  (if (or (empty? lst) (empty? (cdr lst)))
      lst
      (cons (car lst) (alternative-elems (cddr lst)))))
