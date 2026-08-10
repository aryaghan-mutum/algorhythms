#lang racket

;; Author: Anurag Muthyam
;; Geometry: circle/square/rectangle/triangle areas & perimeters,
;; and cube/sphere/cylinder/cone volumes.

(require (only-in "geometry/shapes/two-dimensions/circle.rkt" circle-area circle-circum)
         (only-in "geometry/shapes/two-dimensions/square.rkt" sqr-area sqr-perim)
         (only-in "geometry/shapes/two-dimensions/rectangle.rkt" rectangle-area rectangle-perim)
         (only-in "geometry/shapes/two-dimensions/triangle.rkt" area-of-triangle)
         (only-in "geometry/shapes/three-dimensions/cube.rkt" cube-volume)
         (only-in "geometry/shapes/three-dimensions/sphere.rkt" sphere-volume)
         (only-in "geometry/shapes/three-dimensions/cylinder.rkt" cylindrical-barrel-volume)
         (only-in "geometry/shapes/three-dimensions/right-circular-cone.rkt" right-circular-cone-volume))

(provide area-circle
         circumference-circle
         area-square
         perimeter-square
         area-rectangle
         perimeter-rectangle
         area-triangle
         perimeter-triangle
         volume-cube
         volume-sphere
         volume-cylinder
         volume-cone)

;; area-circle : number? -> number?
(define area-circle circle-area)

;; circumference-circle : number? -> number?
(define circumference-circle circle-circum)

;; area-square : number? -> number?
(define area-square sqr-area)

;; perimeter-square : number? -> number?
(define perimeter-square sqr-perim)

;; area-rectangle : number? number? -> number?
(define area-rectangle rectangle-area)

;; perimeter-rectangle : number? number? -> number?
(define perimeter-rectangle rectangle-perim)

;; area-triangle : number? number? -> number? (base, height)
(define area-triangle area-of-triangle)

;; perimeter-triangle : number? number? number? -> number? (three side lengths)
(define (perimeter-triangle a b c) (+ a b c))

;; volume-cube : number? -> number?
(define volume-cube cube-volume)

;; volume-sphere : number? -> number?
(define volume-sphere sphere-volume)

;; volume-cylinder : number? number? -> number? (radius, height)
(define volume-cylinder cylindrical-barrel-volume)

;; volume-cone : number? number? -> number? (radius, height)
(define volume-cone right-circular-cone-volume)
