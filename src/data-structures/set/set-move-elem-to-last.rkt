#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide set-move-elem-to-last)

;; Move every occurrence of `e` to the end of `lst` (deduped: one `e` at the tail).
;; set-move-elem-to-last : (listof number?) number? -> list?
(define (set-move-elem-to-last lst e)
  (cond ((empty? lst) (list e))
        ((= (car lst) e) (set-move-elem-to-last (cdr lst) e))
        (else (cons (car lst) (set-move-elem-to-last (cdr lst) e)))))
