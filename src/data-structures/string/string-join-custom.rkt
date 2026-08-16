#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide string-join-custom)

;; Join a non-empty list of strings using single-character separator `sep`.
;; string-join-custom : char? (listof string?) -> string?
(define (string-join-custom sep lst)
  (define (join lst)
    (cond ((empty? (cdr lst)) (car lst))
          (else (string-append (car lst) (string sep) (join (cdr lst))))))
  (if (empty? lst) "" (join lst)))
