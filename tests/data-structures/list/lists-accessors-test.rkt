#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum/racket-predicates

(require rackunit)
(require "../lists/list-accessors.rkt")

;; cons
(check-equal? (cons '(a b c) '(d e f)) '((a b c) d e f))
(check-equal? (cons '(a b c) '(d e f)) '((a b c) d e f))
(check-equal? (cons '() '(d e f)) '(() d e f))
(check-equal? (cons '(a b c) '()) '((a b c)))

;; head
(check-equal? (head '(1 2 3)) 1)

;; cadr
(check-equal? (cadr '(1 2 3)) 2)

;; caar
(check-equal? (caar '(((2 4 6) 0) 3 5 7)) '(2 4 6))

;; cdar
(check-equal? (cdar '(((2 4 6) 0) 3 5 7)) '(0))

;; cdar
(check-equal? (cddr '(((2 4 6) 0) 3 5 7)) '(5 7))

;; caaar
(check-equal? (caaar '(((2 4 6) 0) 3 5 7)) 2)

;; caadr
(check-equal? (caadr '(1 (9 7 5) 0)) 9)

;; cadar
(check-equal? (cadar '((3 5 7) 9 2 4)) 5)

;; caddr
(check-equal? (caddr '((3 5 7) 9 2 4)) 2)

;; cdaar
(check-equal? (cdaar '(((3 5 7 9) 9 2 4) -1 -2)) '(5 7 9))

;; cdadr
(check-equal? (cdadr '(0 (1 2 3 4) -1 -2)) '(2 3 4))

;; cddar
(check-equal? (cddar '((0 2 4 6) 3 7 9)) '(4 6))

;; cdddr
(check-equal? (cdddr '((0 2 4 6) 3 7 9)) '(9))

;; caaaar
(check-equal? (caaaar '((((2 4 6) 8) 9) 1 2)) 2)

;; caaadr
(check-equal? (caaadr '(1 ((0 2 4 6) -1) -3)) 0)

;; caadar
(check-equal? (caadar '((1 ((0 2 4 6) -1 -3) -5))) '(0 2 4 6))

;; caaddr
(check-equal? (caaddr '(2 4 (3 5 7) 10)) 3)

;; cadaar
(check-equal? (cadaar '(((1 2 4 3 5 7) 100) 99 98)) 2)

;; cadadr
(check-equal? (cadadr '(1 (2 3 5 7) 0)) 3)

;; caddar
(check-equal? (caddar '((2 4 6 8 10 (9 7)))) 6)

;; cadddr
(check-equal? (cadddr '(3 5 7 9 11)) 9)

;; cdaaar
(check-equal? (cdaaar '((((1 2 3 4 5) 6) 7) 8 9)) '(2 3 4 5))

;; cdaadr
(check-equal? (cdaadr '(1 (( 2 4 6 7) -2) -4)) '(4 6 7))

;; cdadar
(check-equal? (cdadar '((1 (0 2 4 6 7) -2) -4)) '(2 4 6 7))

;; cdaddr
(check-equal? (cdaddr '(0 1 (2 3 4 5 6) 7)) '(3 4 5 6))

;; cddaar
(check-equal? (cddaar '(((1 2 3 4 5) 6) 7 8)) '(3 4 5))

;; cddadr
(check-equal? (cddadr '(1 (2 3 4 5 6) 7)) '(4 5 6))

;; cdddar
(check-equal? (cdddar '((0 1 2 3 4) 7 9)) '(3 4))

;; cddddr
(check-equal? (cddddr '(1 2 3 4 5 6)) '(5 6))
