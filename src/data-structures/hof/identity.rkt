#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide identity)

;; Return the argument unchanged; the identity function.
;; identity : any/c -> any/c
(define (identity x) x)
