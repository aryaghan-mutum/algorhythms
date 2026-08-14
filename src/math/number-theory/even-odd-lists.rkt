;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#lang racket
(require threading)
(provide even-list
         odd-list
         even-numbers-in-range)

;; filter lst to its even elements, preserving original order
;; even-list : (listof integer?) -> (listof integer?)
(define (even-list lst)
  (filter-by-predicate lst even?))

;; filter lst to its odd elements, preserving original order
;; odd-list : (listof integer?) -> (listof integer?)
(define (odd-list lst)
  (filter-by-predicate lst odd?))

;; keep only the elements of lst that satisfy pred, preserving original order
(define (filter-by-predicate lst pred)
  (define (aux lst acc)
    (cond ((empty? lst) acc)
          ((pred (car lst)) (aux (cdr lst) (cons (car lst) acc)))
          (else (aux (cdr lst) acc))))
  (reverse (aux lst '())))

;; even-numbers-in-range : integer? integer? -> (listof integer?)
(define (even-numbers-in-range start end)
  (~> (range start (add1 end)) (filter even? _)))
