#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide duplicates-by-elem
         duplicates-by-fn)

;; Return every occurrence of `e` inside `lst` as a list (order reversed).
;; duplicates-by-elem : list? any/c -> list?
(define (duplicates-by-elem lst e)
  (define (loop lst acc)
    (cond ((empty? lst) acc)
          ((equal? e (car lst)) (loop (cdr lst) (cons (car lst) acc)))
          (else (loop (cdr lst) acc))))
  (loop lst '()))

;; Return every element of `lst` for which `fn` is truthy (like filter, reversed).
;; duplicates-by-fn : (any/c -> boolean?) list? -> list?
(define (duplicates-by-fn fn lst)
  (define (loop lst acc)
    (cond ((empty? lst) acc)
          ((fn (car lst)) (loop (cdr lst) (cons (car lst) acc)))
          (else (loop (cdr lst) acc))))
  (loop lst '()))
