;; Author: Anurag Muthyam

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