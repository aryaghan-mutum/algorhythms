#lang racket

;; Author: Anurag Muthyam
;; Trigonometry: degree-based sin/cos/tan (and inverses), degree<->radian
;; conversion, and the Pythagorean hypotenuse.

(provide sin-deg
         cos-deg
         tan-deg
         asin-deg
         acos-deg
         atan-deg
         degrees->radians
         radians->degrees
         hypotenuse)

;; degrees->radians : number? -> number?
(define (degrees->radians degrees)
  (* degrees (/ pi 180)))

;; radians->degrees : number? -> number?
(define (radians->degrees radians)
  (* radians (/ 180 pi)))

;; sin-deg : number? -> number? (sine of an angle given in degrees)
(define (sin-deg degrees) (sin (degrees->radians degrees)))

;; cos-deg : number? -> number? (cosine of an angle given in degrees)
(define (cos-deg degrees) (cos (degrees->radians degrees)))

;; tan-deg : number? -> number? (tangent of an angle given in degrees)
(define (tan-deg degrees) (tan (degrees->radians degrees)))

;; asin-deg : number? -> number? (arcsine, result in degrees)
(define (asin-deg x) (radians->degrees (asin x)))

;; acos-deg : number? -> number? (arccosine, result in degrees)
(define (acos-deg x) (radians->degrees (acos x)))

;; atan-deg : number? -> number? (arctangent, result in degrees)
(define (atan-deg x) (radians->degrees (atan x)))

;; hypotenuse : number? number? -> number? (length of a right triangle's hypotenuse)
(define (hypotenuse a b) (sqrt (+ (sqr a) (sqr b))))
