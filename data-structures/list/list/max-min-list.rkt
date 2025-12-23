;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require rackunit racket/trace)
(provide max-list-v1 max-list-v2 min-list-v1 min-list-v2)

;; get the maximum number in a list using sort function version 1
(define (max-list-v1 lst)
  (car (sort lst >)))

;; get the maximum number in a list version 2
(define (max-list-v2 lst)
  (cond ((empty? lst) lst)
        ((empty? (cdr lst)) (car lst))
        ((< (car lst) (max-list-v2 (cdr lst))) (max-list-v2 (cdr lst)))
        (else (car lst))))

;; get the minimum number in a list using sort function version 1
(define (min-list-v1 lst)
  (car (sort lst <)))

;; get the minimum number in a list version 2
(define (min-list-v2 lst)
  (cond ((empty? lst) lst)
        ((empty? (cdr lst)) (car lst))
        ((> (car lst) (min-list-v2 (cdr lst))) (min-list-v2 (cdr lst)))
        (else (car lst))))