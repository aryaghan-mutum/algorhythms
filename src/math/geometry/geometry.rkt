#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide polygon-interior-angles-sum
         polygon-interior-angles-sum-lst
         distance-between-two-points
         midpoints
         slope)

;; Sum of interior angles of an n-sided convex polygon, in degrees.
;; polygon-interior-angles-sum : exact-integer? -> exact-integer?
(define (polygon-interior-angles-sum n)
  (* (- n 2) 180))

;; Map polygon-interior-angles-sum over a list of side-counts.
;; polygon-interior-angles-sum-lst : (listof exact-integer?) -> (listof exact-integer?)
(define (polygon-interior-angles-sum-lst lst)
  (map polygon-interior-angles-sum lst))

;; Euclidean distance between (x1, y1) and (x2, y2).
;; distance-between-two-points : real? real? real? real? -> real?
(define (distance-between-two-points x1 x2 y1 y2)
  (sqrt (+ (sqr (- x1 x2)) (sqr (- y1 y2)))))

;; Midpoint of two points, returned as a cons pair (x . y).
;; midpoints : real? real? real? real? -> (cons real? real?)
(define (midpoints x1 x2 y1 y2)
  (cons (/ (+ x1 x2) 2) (/ (+ y1 y2) 2)))

;; Slope-intercept form: y = m*x + b for a given slope m, x, and y-intercept b.
;; slope : real? real? real? -> real?
(define (slope m x b)
  (+ (* m x) b))