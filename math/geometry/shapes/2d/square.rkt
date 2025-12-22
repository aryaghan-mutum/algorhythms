#lang racket

;; Author: Anurag Muthyam

(require rackunit)
(provide sqr-area
         sqr-area-lst
         sqr-perim
         sqr-perim-lst)

;; area of square
(define sqr-area
  (lambda (s) (* s s)))

;; area of square for each element in a list
(define sqr-area-lst
  (lambda (lst) (map sqr-area lst)))

;; perimeter of a square
(define sqr-perim
  (lambda (s) (* 4 s)))

;; perimeter of square for each element in a list
(define sqr-perim-lst
  (lambda (lst) (map sqr-perim lst)))

;; Tests
(check-equal? (sqr-area 5) 25)
(check-equal? (sqr-perim 5) 20)
(check-equal? (sqr-area-lst '(2 3 4)) '(4 9 16))
(check-equal? (sqr-perim-lst '(2 3 4)) '(8 12 16))
