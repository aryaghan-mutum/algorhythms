#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide parallelogram-area
         parallelogram-area-lst
         parallelogram-perim
         parallelogram-perim-lst)

;; Area of a parallelogram: base * perpendicular height.
;; parallelogram-area : real? real? -> real?
(define (parallelogram-area base height) (* base height))

;; parallelogram-area mapped over a list of (base height) pairs.
;; parallelogram-area-lst : (listof (list real? real?)) -> (listof real?)
(define (parallelogram-area-lst lst) (map parallelogram-area lst))

;; Perimeter of a parallelogram: 2*(base + adjacent-side).
;; parallelogram-perim : real? real? -> real?
(define (parallelogram-perim base height)
  (+ (* 2 base) (* 2 height)))

;; parallelogram-perim mapped over a list of (base side) pairs.
;; parallelogram-perim-lst : (listof (list real? real?)) -> (listof real?)
(define (parallelogram-perim-lst lst) (map parallelogram-perim lst))