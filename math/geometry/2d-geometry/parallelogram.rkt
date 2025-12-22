#lang racket

;Author: Anurag Muthyam

(provide parallelogram-area
         parallelogram-area-lst
         parallelogram-perim
         parallelogram-perim-lst)

;; area of a parallelogram
(define parallelogram-area
  (λ (base height) (* base height)))

;; area of a parallelogram for each element in a list
(define parallelogram-area-lst
  (λ (lst) (map parallelogram-area lst)))
         
;; permiter of a perim-parallelogram
(define parallelogram-perim
  (λ (base height)
    (+ (* 2 base) (* 2 height))))

;; permiter of a parallelogram for each element in a list
(define parallelogram-perim-lst
  (λ (lst) (map parallelogram-perim lst)))