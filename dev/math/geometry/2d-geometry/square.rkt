#lang racket

;Author: Anurag Muthyam

(provide sqr-area
         sqr-area-lst
         sqr-perim
         sqr-perim-lst)

;; area of square 
(define sqr-area
  (λ (s) (* s s)))

;; area of square for each element in a list
(define sqr-area-lst
  (λ (lst) (map sqr-area lst)))

;; perimeter of a square 
(define sqr-perim
  (λ (s) (* 4 s)))

;; perimeter of square for each element in a list
(define sqr-perim-lst
  (λ (lst) (map sqr-perim lst)))
