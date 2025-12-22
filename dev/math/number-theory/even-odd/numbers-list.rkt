;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

;; Can also be written as using filter:
;;(filter even? '(-1 -2 -3 -4 -5))
;;(filter odd? '(-1 -2 -3 -4 -5))
;; Note: You can only pass a predicate to the function

#lang racket

(require rackunit racket/trace threading)
(provide even-list odd-list)

;; get a list of even numbers
(define (even-list lst)
  (numbers-list lst even?))

;; get a list of odd numbers
(define (odd-list lst)
  (numbers-list lst odd?))

;; get a list of odd numbers
(define (zeros-list lst)
  (numbers-list lst zero?))

;; get a list of numbers based on a function fn
(define (numbers-list lst fn)
  (define (numbers-list-aux lst rlst)
    (cond ((empty? lst) rlst)
          ((fn (car lst))
           (numbers-list-aux (cdr lst) (cons (car lst) rlst)))
          (else (numbers-list-aux (cdr lst) rlst))))
  (reverse (numbers-list-aux lst '())))

(check-equal? (even-list '()) '())
(check-equal? (even-list '(0 1 2 3 4 5)) '(0 2 4))
(check-equal? (even-list '(-1 -2 -3 -4 -5)) '(-2 -4))

(check-equal? (odd-list '()) '())
(check-equal? (odd-list '(0 1 2 3 4 5)) '(1 3 5))
(check-equal? (odd-list '(-1 -2 -3 -4 -5)) '(-1 -3 -5))

(check-equal? (zeros-list '()) '())
(check-equal? (zeros-list '(0 1 2 3 4 5 0)) '(0 0))
