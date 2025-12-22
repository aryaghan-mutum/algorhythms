#lang racket

;; Author: Anurag Muthyam
;; Squares of Sum:

(provide sqrs-sum)

;; squares of sum using recursion 
(define (sqrs-sum n)
  (define (sqrs-sum-iter lst sum)
    (if (empty? lst)
        (sqr sum)
        (sqrs-sum-iter (cdr lst)
                       (+ sum (car lst)))))
  (sqrs-sum-iter (build-list n values) 0))
  