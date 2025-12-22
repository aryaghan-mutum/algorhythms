;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require rackunit)
(provide compress)

;; compress: get unique elements from a list using append
;; the order of the elements mustn't be changed.
(define (compress lst [acc '()])
  (if (>= (length lst) 2)
      (if (equal? (car lst) (cadr lst))
          (compress (cdr lst) acc)
          (compress (cdr lst) (append acc (list (car lst)))))
      (append acc lst)))

(check-equal? (compress '()) '())
(check-equal? (compress '(a a a a b c c a a d e e e e)) '(a b c a d e))
