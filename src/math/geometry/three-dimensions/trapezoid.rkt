#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide trapezoid-area)

;; Area of a trapezoid with parallel side lengths a, b and perpendicular height h.
;; trapezoid-area : real? real? real? -> real?
(define (trapezoid-area a b h) (* 0.5 (+ a b) h))
