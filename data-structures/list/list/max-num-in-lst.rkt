#lang racket

;; method 1
(define (max-num-in-lst lst)
     (cond ((null? lst) lst)
           ((empty? (cdr lst)) (car lst)) 
           ((< (car lst) (max-num-in-lst (cdr lst))) (max-num-in-lst (cdr lst)))
           (else (car lst))))

;; method 2
(define (maxim lst)
  (vector-argmax
   (lambda (x) x)
   (list->vector lst)))

