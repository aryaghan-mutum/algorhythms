#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

(require threading rackunit racket/trace)

;; get a nested lists of negative and positive numbers
(define (separate-neg-and-pos lst)
  (define (aux lst nlst plst)
    (cond ((empty? lst) (list (sort nlst <) (sort plst <)))
          ((negative? (car lst)) (aux (cdr lst) (cons (car lst) nlst) plst))
          (else (aux (cdr lst) nlst (cons (car lst) plst)))))
  (aux lst '() '()))

;; get negative list of elems
(define (neg-lst lst)
  (~> lst
      (separate-neg-and-pos _)
      (car _)))

;; get positive list of elems
(define (pos-lst lst)
  (~> lst
      (separate-neg-and-pos _)
      (last _)))

(check-equal? (separate-neg-and-pos '()) '(() ()))
(check-equal? (separate-neg-and-pos '(-1 1)) '((-1) (1)))
(check-equal? (separate-neg-and-pos '(-1 -1)) '((-1 -1) ()))
(check-equal? (separate-neg-and-pos '(1 1)) '(() (1 1)))
(check-equal? (separate-neg-and-pos '(21 32 -4 12 0 -32 443)) '((-32 -4) (0 12 21 32 443)))

(check-equal? (neg-lst '()) '())
(check-equal? (neg-lst '(-1)) '(-1))
(check-equal? (neg-lst '(100)) '())
(check-equal? (neg-lst '(-1 -2 -3)) '(-3 -2 -1))
(check-equal? (neg-lst '(-3 -2 -1)) '(-3 -2 -1))
(check-equal? (neg-lst '(21 32 -4 12 0 -32 443)) '(-32 -4))

(check-equal? (pos-lst '()) '())
(check-equal? (pos-lst '(-1)) '())
(check-equal? (pos-lst '(100)) '(100))
(check-equal? (pos-lst '(1 2 3)) '(1 2 3))
(check-equal? (pos-lst '(-3 -2 -1)) '())
(check-equal? (pos-lst '(21 32 -4 12 0 -32 443)) '(0 12 21 32 443))
