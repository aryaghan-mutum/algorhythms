#lang racket

;; Author: Anurag Muthyam

(require rackunit)
(provide parallelogram-area
         parallelogram-area-lst
         parallelogram-perim
         parallelogram-perim-lst)

;; area of a parallelogram
(define parallelogram-area
  (λ (base height) (* base height)))

;; area of a parallelogram for each element in a list
(define parallelogram-area-lst
  (λ (lst) (map (λ (p) (parallelogram-area (car p) (cadr p))) lst)))

;; perimeter of a parallelogram
(define parallelogram-perim
  (λ (base height)
    (+ (* 2 base) (* 2 height))))

;; perimeter of a parallelogram for each element in a list
(define parallelogram-perim-lst
  (λ (lst) (map (λ (p) (parallelogram-perim (car p) (cadr p))) lst)))

;; Tests
(check-equal? (parallelogram-area 5 3) 15)
(check-equal? (parallelogram-perim 5 3) 16)
