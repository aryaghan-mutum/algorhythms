;; Author: Anurag Muthyam
;; reduce - Reduce a list to a single value

#lang racket

(provide reduce)

;; Reduce lst to a single value by applying fn cumulatively; returns #f on empty.
;; reduce : (any/c any/c -> any/c) list? -> any/c
(define (reduce fn lst)
  (if (empty? lst)
      #f
      (let loop ((acc (first lst)) (lst (rest lst)))
        (if (empty? lst)
            acc
            (loop (fn acc (car lst)) (cdr lst))))))
