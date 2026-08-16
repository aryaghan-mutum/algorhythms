;; Author: Anurag Muthyam
;; scan - Returns all intermediate accumulator values

#lang racket

(provide scan)

;; Left-fold that keeps every intermediate accumulator value, including init.
;; scan : (any/c any/c -> any/c) any/c list? -> list?
(define (scan fn init lst)
  (let loop ((acc init) (lst lst) (result (list init)))
    (if (empty? lst)
        (reverse result)
        (let ((new-acc (fn acc (car lst))))
          (loop new-acc (cdr lst) (cons new-acc result))))))
