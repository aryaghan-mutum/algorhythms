#lang racket

;; Author: Anurag Muthyam
;; Find the first element in the list

(define (my-first L)
    (if (null? L)
        '()
        (car L)))

