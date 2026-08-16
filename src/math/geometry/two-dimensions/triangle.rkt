#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide area-of-triangle
         heron
         perimeter-triangle
         (rename-out [area-of-triangle area-triangle]))

;; Area of a triangle given base and perpendicular height.
;; area-of-triangle : real? real? -> real?
(define (area-of-triangle base height)
  (* 0.5 base height))

;; Perimeter of a triangle from its three side lengths.
;; perimeter-triangle : real? real? real? -> real?
(define (perimeter-triangle a b c) (+ a b c))

;; Area of a triangle from side lengths a, b, c (Heron's formula).
;; heron : real? real? real? -> real?
(define (heron a b c)
  (let ((s (/ (+ a b c) 2.0)))
    (sqrt (* s (- s a) (- s b) (- s c)))))
