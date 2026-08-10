#lang racket

;; creating cons, car cdr using lambda 
(define (lcons a b)
  (lambda (cmd)
    (if (equal? cmd "car")
        a
        b)))

(define (mcar pair)
  (pair "car"))

(define (mcdr pair)
  (pair "cdr"))

(mcar (lcons 1 2))  ;1
(mcdr (lcons 1 2))  ;2




(call/cc
  (lambda (k)
    (foldl (lambda (a b) "?") "?" '())
    (void)))