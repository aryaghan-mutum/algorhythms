;; Author: Anurag Muthyam
;; reduce - Reduce a list to a single value

#lang racket

(provide reduce)

;; Reduce a list to a single value by applying fn cumulatively
;; (reduce + '(1 2 3 4)) => 10
;; (reduce * '(1 2 3 4)) => 24
(define (reduce fn lst)
  (if (empty? lst)
      #f
      (let loop ((acc (first lst)) (lst (rest lst)))
        (if (empty? lst)
            acc
            (loop (fn acc (car lst)) (cdr lst))))))
