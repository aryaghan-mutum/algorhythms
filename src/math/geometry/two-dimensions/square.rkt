#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide sqr-area
         sqr-area-lst
         sqr-perim
         sqr-perim-lst
         (rename-out [sqr-area area-square]
                     [sqr-perim perimeter-square]))

;; Area of a square with side length s.
;; sqr-area : real? -> real?
(define (sqr-area s) (* s s))

;; sqr-area mapped over a list of side lengths.
;; sqr-area-lst : (listof real?) -> (listof real?)
(define (sqr-area-lst lst) (map sqr-area lst))

;; Perimeter of a square with side length s.
;; sqr-perim : real? -> real?
(define (sqr-perim s) (* 4 s))

;; sqr-perim mapped over a list of side lengths.
;; sqr-perim-lst : (listof real?) -> (listof real?)
(define (sqr-perim-lst lst) (map sqr-perim lst))
