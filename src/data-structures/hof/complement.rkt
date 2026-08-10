;; Author: Anurag Muthyam

#lang racket

(require rackunit racket/trace)
(provide complement-v1 complement-v2 complement-v3)

(define (complement-v1 fn)
  (lambda x (not (apply fn x))))

(define (complement-v2 fn x)
  (not (fn x)))

(define (complement-v3 fn)
  (lambda (x) (not (fn x))))
