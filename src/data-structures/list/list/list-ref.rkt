#lang racket

;; Author: Anurag Muthyam
;; Get a specific element from the list

(define (my-list-ref lst n)
    (if (= n 0)    ;;(zero? n)
        (car lst)
        (my-list-ref (cdr lst) (- n 1))))
