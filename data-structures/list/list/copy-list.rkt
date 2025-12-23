#lang racket

;;Author: Anurag Muthyam
  
(define (copy-list-m1 lst)
  (if (empty? lst)
      lst
      (cons (car lst) (copy-list-m1 (cdr lst)))))

(define (atom? x)
  (not (pair? x)))

(define (copy-list-m2 lst)
  (if (atom? lst)
      lst
      (cons (car lst) (copy-list-m2 (cdr lst)))))