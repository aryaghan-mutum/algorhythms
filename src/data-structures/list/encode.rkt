#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require "pack.rkt")

(provide encode)

;; Run-length encode `lst`: consecutive duplicates collapse to (count element) pairs.
;; encode : list? -> (listof (list exact-nonnegative-integer? any/c))
(define (encode lst)
  (map (lambda (run) (list (length run) (car run)))
       (pack lst)))
