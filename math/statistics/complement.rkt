;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#lang racket
(require rackunit racket/trace)
(provide complement-v1 complement-v2 complement-v3)

;; apply version 1
(define (complement-v1 fn)
  (lambda x (not (apply fn x))))

;; =================

;; version 2
(define (complement-v2 fn x)
  (not (fn x)))

;; =================

;; version 3
(define (complement-v3 fn)
  (lambda (x) (not (fn x))))

;; =================
