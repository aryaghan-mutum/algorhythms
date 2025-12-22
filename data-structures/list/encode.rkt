;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require rackunit "pack.rkt")
(provide encode)

;; Algorithm:
;; encoding data compression procecure.
;; consecutive duplicates of elements are encoded as lists (N E) where N is the number of duplicates of the element E.

(define (encode lst)
  (encode-helper (pack lst)))

(define (encode-helper lst [acc '()])
  (if (empty? lst)
      acc
      (encode-helper (cdr lst)
                     (append acc (list (cons (length (car lst)) (list (caar lst))))))))

(check-equal? (encode '(a a a a b c c a a d e e e e)) '((4 a) (1 b) (2 c) (2 a) (1 d) (4 e)))
