#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide angle-to-degrees
         angle-to-radians
         angle-reflect)

;; Convert radians to degrees.
;; angle-to-degrees : real? -> real?
(define (angle-to-degrees angle)
  (/ (* angle 180) pi))

;; Convert degrees to radians.
;; angle-to-radians : real? -> real?
(define (angle-to-radians angle)
  (* angle (/ pi 180)))

;; Angle of reflection off a surface, wrapped into the [0, 360) range.
;; angle-reflect : real? real? -> real?
(define (angle-reflect incidence-angle surface-angle)
  (let ((a (- (* surface-angle 2) incidence-angle)))
    (cond ((>= a 360) (- a 360))
          ((< a 0) (+ a 360))
          (else a))))
