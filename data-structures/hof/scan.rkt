;; Author: Anurag Muthyam
;; scan - Returns all intermediate accumulator values

#lang racket

(provide scan)

;; Scan - returns list of all intermediate accumulator values
;; (scan + 0 '(1 2 3 4)) => '(0 1 3 6 10)
(define (scan fn init lst)
  (let loop ((acc init) (lst lst) (result (list init)))
    (if (empty? lst)
        (reverse result)
        (let ((new-acc (fn acc (car lst))))
          (loop new-acc (cdr lst) (cons new-acc result))))))
