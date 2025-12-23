;; Author: Anurag Muthyam
;; zip-with - Combine two lists with a function

#lang racket

(provide zip-with)

;; Combine two lists element-wise using a function
;; (zip-with + '(1 2 3) '(4 5 6)) => '(5 7 9)
(define (zip-with fn lst1 lst2)
  (cond ((or (empty? lst1) (empty? lst2)) '())
        (else (cons (fn (car lst1) (car lst2))
                    (zip-with fn (cdr lst1) (cdr lst2))))))
