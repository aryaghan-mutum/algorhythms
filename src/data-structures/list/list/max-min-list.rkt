;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require rackunit racket/trace)
(provide max-list min-list)

;; get the maximum number in a list (linear, no sort needed)
(define (max-list lst)
  (cond ((empty? lst) lst)
        ((empty? (cdr lst)) (car lst))
        ((< (car lst) (max-list (cdr lst))) (max-list (cdr lst)))
        (else (car lst))))

;; get the minimum number in a list (linear, no sort needed)
(define (min-list lst)
  (cond ((empty? lst) lst)
        ((empty? (cdr lst)) (car lst))
        ((> (car lst) (min-list (cdr lst))) (min-list (cdr lst)))
        (else (car lst))))

;; Alternative implementations kept for reference (commented out) --
;; max-list/min-list above are the active implementations (O(n), no sort).
#|
(define (max-list-v1 lst)
  (car (sort lst >)))

(define (min-list-v1 lst)
  (car (sort lst <)))
|#