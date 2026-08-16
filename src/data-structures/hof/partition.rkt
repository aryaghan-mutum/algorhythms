;; Author: Anurag Muthyam
;; partition - Split list by predicate

#lang racket

(provide partition-list)

;; Split lst into (list matching non-matching) based on predicate pred.
;; partition-list : (any/c -> boolean?) list? -> (list list? list?)
(define (partition-list pred lst)
  (let loop ((lst lst) (yes '()) (no '()))
    (cond ((empty? lst) (list (reverse yes) (reverse no)))
          ((pred (car lst)) (loop (cdr lst) (cons (car lst) yes) no))
          (else (loop (cdr lst) yes (cons (car lst) no))))))
