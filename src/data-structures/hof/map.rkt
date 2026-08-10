;; Author: Anurag Muthyam
;; map - Apply function to each element in a list

#lang racket

(provide mapper)

;; Apply fn to each element and return new list
;; (mapper sqr '(1 2 3 4)) => '(1 4 9 16)
(define (mapper fn lst)
  (if (empty? lst)
      '()
      (cons (fn (car lst)) (mapper fn (cdr lst)))))