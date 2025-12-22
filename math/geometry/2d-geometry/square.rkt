#lang racket

;Author: Anurag Muthyam

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
