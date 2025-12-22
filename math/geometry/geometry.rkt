#lang racket

;; Author: Anurag Mthyam

(provide polygon-interior-angles-sum
         polygon-interior-angles-sum-lst
         distance-between-two-points
         midpoints
         slope)

;; sum of interior angles of a polygon
(define polygon-interior-angles-sum
  (λ (n) (* (- n 2) 180)))

;; sum of interior angles of a polygon for each element in a list
(define polygon-interior-angles-sum-lst
  (λ (lst)
    (map polygon-interior-angles-sum lst)))

;; distance between two points
(define distance-between-two-points
  (λ (x1 x2 y1 y2)
    (sqrt (+ (sqr (- x1 x2))
              (sqr (- y1 y2))))))

;; mid points 
(define midpoints
  (λ (x1 x2 y1 y2)
    (let ((a (/ (+ x1 x2) 2))
          (b (/ (+ y1 y2) 2)))
      (cons a b))))

;; slope intercept 
(define slope
  (λ (m x b)
    (+ (* m x) b)))