;; Author: Anurag Muthyam
;; take-while / drop-while

#lang racket

(provide take-while
         drop-while)

;; Take prefix elements while pred is true; stops at the first failure.
;; take-while : (any/c -> boolean?) list? -> list?
(define (take-while pred lst)
  (cond ((empty? lst) '())
        ((pred (car lst)) (cons (car lst) (take-while pred (cdr lst))))
        (else '())))

;; Drop prefix elements while pred is true; returns the remainder.
;; drop-while : (any/c -> boolean?) list? -> list?
(define (drop-while pred lst)
  (cond ((empty? lst) '())
        ((pred (car lst)) (drop-while pred (cdr lst)))
        (else lst)))
