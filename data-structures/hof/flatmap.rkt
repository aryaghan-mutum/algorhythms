;; Author: Anurag Muthyam
;; flatmap - Flatten nested lists

#lang racket

(provide flatmap)

;; Flatten nested lists into a single flat list
;; (flatmap '(1 (2 3) ((4 5) 6))) => '(1 2 3 4 5 6)
(define (flatmap lst)
  (define (helper lst acc)
    (cond ((empty? lst) acc)
          ((not (list? (car lst)))
           (helper (cdr lst) (cons (car lst) acc)))
          (else
           (helper (cdr lst) (helper (car lst) acc)))))
  (reverse (helper lst '())))
