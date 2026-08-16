;; Author: Anurag Muthyam
;; flatmap - Flatten nested lists

#lang racket

(provide flatmap)

;; Flatten nested lists into a single flat list (iterative accumulator).
;; flatmap : list? -> list?
(define (flatmap lst)
  (define (helper lst acc)
    (cond ((empty? lst) acc)
          ((not (list? (car lst)))
           (helper (cdr lst) (cons (car lst) acc)))
          (else
           (helper (cdr lst) (helper (car lst) acc)))))
  (reverse (helper lst '())))
