;; Author: Anurag Muthyam
;; take-while / drop-while

#lang racket

(provide take-while
         drop-while)

;; Take elements from the front while pred returns true
;; (take-while even? '(2 4 6 7 8)) => '(2 4 6)
(define (take-while pred lst)
  (cond ((empty? lst) '())
        ((pred (car lst)) (cons (car lst) (take-while pred (cdr lst))))
        (else '())))

;; Drop elements from the front while pred returns true
;; (drop-while even? '(2 4 6 7 8)) => '(7 8)
(define (drop-while pred lst)
  (cond ((empty? lst) '())
        ((pred (car lst)) (drop-while pred (cdr lst)))
        (else lst)))
