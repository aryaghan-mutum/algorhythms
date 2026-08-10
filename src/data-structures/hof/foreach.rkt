;; Author: Anurag Muthyam
;; foreach - Apply function to each element

#lang racket

(provide foreach)

;; Apply fn to each element and return new list
;; (foreach add1 '(1 2 3)) => '(2 3 4)
(define (foreach fn lst)
  (if (empty? lst)
      '()
      (cons (fn (car lst)) (foreach fn (cdr lst)))))
