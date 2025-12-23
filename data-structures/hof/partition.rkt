;; Author: Anurag Muthyam
;; partition - Split list by predicate

#lang racket

(provide partition-list)

;; Split a list into two lists based on predicate
;; Returns (list satisfying not-satisfying)
;; (partition-list even? '(1 2 3 4 5 6)) => '((2 4 6) (1 3 5))
(define (partition-list pred lst)
  (let loop ((lst lst) (yes '()) (no '()))
    (cond ((empty? lst) (list (reverse yes) (reverse no)))
          ((pred (car lst)) (loop (cdr lst) (cons (car lst) yes) no))
          (else (loop (cdr lst) yes (cons (car lst) no))))))
