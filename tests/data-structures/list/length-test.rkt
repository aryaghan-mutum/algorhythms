#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum/racket-lists

(require rackunit)
(require "./lists/length.rkt")

;; length
(check-eqv? (length '()) 0)
(check-eqv? (length '(a)) 1)
(check-eqv? (length '(1 2)) 2)
(check-eqv? (length '(1 2 3 a b c)) 6)

;; length-by using <
(check-eqv? (length-by '(a b) '(c d e) <) 2)
(check-eqv? (length-by '(a b) '(c d) <) 2)
(check-eqv? (length-by '(a b) '(c) <) 1)
(check-eqv? (length-by '(a) '(1) <) 1)
(check-eqv? (length-by '() '() <) 0)

;; length-by using >
(check-eqv? (length-by '(a b) '(c d e) >) 3)
(check-eqv? (length-by '(a b) '(c d) >) 2)
(check-eqv? (length-by '(a b) '(c) >) 2)
(check-eqv? (length-by '(a) '(1) >) 1)
(check-eqv? (length-by '() '() >) 0)

;; shorter
(check-equal? (shorter '(a b) '(c d e)) '(a b))
(check-equal? (shorter '(a b) '(c d)) '(a b))
(check-equal? (shorter '(a b) '(c)) '(c))
(check-equal? (shorter '(a) '(1)) '(a))
(check-equal? (shorter '() '()) '())
(check-equal? (shorter '(1) null) null)

;; longer
(check-equal? (longer '(a b) '(c d e)) '(c d e))
(check-equal? (longer '(a b) '(c d)) '(a b))
(check-equal? (longer '(a b) '(c)) '(a b))
(check-equal? (longer '(a) '(1)) '(a))
(check-equal? (longer '() '()) '())
(check-equal? (longer '(1) null) '(1))

;; length-lst using <
(check-equal? (length-lst '(a b) '(c d e) <) '(a b))
(check-equal? (length-lst '(a b) '(c d) <) '(a b))
(check-equal? (length-lst '(a b) '(c) <) '(c))
(check-equal? (length-lst '(a) '(1) <) '(a))
(check-equal? (length-lst '() '() <) '())
(check-equal? (length-lst '(1) null <) '())

;; length-lst using >
(check-equal? (length-lst '(a b) '(c d e) >) '(c d e))
(check-equal? (length-lst '(a b) '(c d) >) '(a b))
(check-equal? (length-lst '(a b) '(c) >) '(a b))
(check-equal? (length-lst '(a) '(1) >) '(a))
(check-equal? (length-lst '() '() >) '())
(check-equal? (length-lst '(1) null >) '(1))
