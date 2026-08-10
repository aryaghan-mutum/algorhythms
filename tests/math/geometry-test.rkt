#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require rackunit
         rackunit/text-ui
         "../../src/math/geometry/geometry.rkt"
         "../../src/math/geometry/pythagoras.rkt"
         "../../src/math/geometry/angles.rkt"
         "../../src/math/geometry/two-dimensions/main.rkt"
         "../../src/math/geometry/three-dimensions/main.rkt"
         "../../src/math/geometry/lines/main.rkt"
         "../../src/math/geometry/pi/main.rkt")

(define geometry-tests
  (test-suite
   "geometry"

   (test-suite
    "core geometry - valid"
    (test-case "polygon-interior-angles-sum of a triangle is 180" (check-equal? (polygon-interior-angles-sum 3) 180))
    (test-case "polygon-interior-angles-sum of a quadrilateral is 360" (check-equal? (polygon-interior-angles-sum 4) 360))
    (test-case "polygon-interior-angles-sum-lst maps over a list"
      (check-equal? (polygon-interior-angles-sum-lst '(3 4)) '(180 360)))
    (test-case "distance-between-two-points is the classic 3-4-5 hypotenuse"
      (check-equal? (distance-between-two-points 0 3 0 4) 5))
    (test-case "midpoints computes the average of both coordinates"
      (check-equal? (midpoints 0 4 0 6) (cons 2 3)))
    (test-case "slope evaluates y=mx+b" (check-equal? (slope 2 3 1) 7))
    (test-case "pythagoras is the classic 5-12-13 triple" (check-equal? (pythagoras 5 12) 13)))

   (test-suite
    "core geometry - edge"
    (test-case "distance-between-two-points of identical points is 0"
      (check-equal? (distance-between-two-points 2 2 5 5) 0))
    (test-case "pythagoras with a zero leg returns the other leg"
      (check-equal? (pythagoras 0 7) 7)))

   (test-suite
    "angles - valid"
    (test-case "angle-to-degrees(pi) is 180" (check-within (angle-to-degrees pi) 180 0.001))
    (test-case "angle-to-radians(180) is pi" (check-within (angle-to-radians 180) pi 0.001))
    (test-case "angle-reflect within [0,360) returns as-is" (check-equal? (angle-reflect 30 60) 90)))

   (test-suite
    "angles - edge"
    (test-case "angle-reflect wraps a result >= 360" (check-equal? (angle-reflect 10 300) 230))
    (test-case "angle-reflect wraps a negative result" (check-equal? (angle-reflect 400 60) 80)))

   (test-suite
    "2D shapes - valid"
    (test-case "circle-area matches pi*r^2" (check-equal? (circle-area 2) (* pi (sqr 2))))
    (test-case "circle-circum matches 2*pi*r" (check-equal? (circle-circum 2) (* 2 pi 2)))
    (test-case "circle-arc-length (r*angle)" (check-equal? (circle-arc-length 4 2) 8))
    (test-case "circle-arc-len (sector area, 0.5*r^2*angle)" (check-equal? (circle-arc-len 4 2) 16.0))
    (test-case "rectangle-area" (check-equal? (rectangle-area 4 5) 20))
    (test-case "rectangle-perim" (check-equal? (rectangle-perim 4 5) 18))
    (test-case "rectangle-volume" (check-equal? (rectangle-volume 2 3 4) 24))
    (test-case "rectangle-area-solid (surface area)" (check-equal? (rectangle-area-solid 2 3 4) 52))
    (test-case "sqr-area" (check-equal? (sqr-area 5) 25))
    (test-case "sqr-perim" (check-equal? (sqr-perim 5) 20))
    (test-case "area-of-triangle" (check-equal? (area-of-triangle 4 3) 6.0))
    (test-case "heron's formula on a 3-4-5 right triangle" (check-equal? (heron 3 4 5) 6.0))
    (test-case "parallelogram-area" (check-equal? (parallelogram-area 5 3) 15))
    (test-case "parallelogram-perim" (check-equal? (parallelogram-perim 5 3) 16))
    (test-case "rhombus-area" (check-equal? (rhombus-area 6 8) 24))
    (test-case "rhombus-perimeter" (check-equal? (rhombus-perimeter 5) 20)))

   (test-suite
    "2D shapes - edge"
    (test-case "circle-area of radius 0 is 0" (check-equal? (circle-area 0) 0))
    (test-case "heron's formula on a degenerate triangle is 0"
      (check-equal? (heron 1 2 3) 0.0))
    (test-case "rectangle-area with a zero dimension is 0" (check-equal? (rectangle-area 0 5) 0))
    (test-case "circle-area-lst maps over a list" (check-equal? (circle-area-lst '(0 1)) (list (circle-area 0) (circle-area 1)))))

   (test-suite
    "3D shapes - valid"
    (test-case "cube-volume" (check-equal? (cube-volume 3) 27))
    (test-case "cone-area matches pi*r*slant" (check-equal? (cone-area 3 5) (* pi 3 5)))
    (test-case "cone-volume (b*h/3)" (check-equal? (cone-volume 12 5) 20))
    (test-case "right-circular-cone-volume matches (1/3)*pi*r^2*h"
      (check-equal? (right-circular-cone-volume 3 4) (* 1/3 pi (sqr 3) 4)))
    (test-case "cylindrical-barrel-volume matches pi*r^2*h"
      (check-equal? (cylindrical-barrel-volume 2 5) (* pi (sqr 2) 5)))
    (test-case "sphere-volume matches (4/3)*pi*r^3" (check-equal? (sphere-volume 3) (* 4/3 pi 27)))
    (test-case "sphere-area matches 4*pi*r^2" (check-equal? (sphere-area 3) (* 4 pi (sqr 3))))
    (test-case "trapezoid-area (0.5*(a+b)*h)" (check-equal? (trapezoid-area 3 5 4) 16.0)))

   (test-suite
    "3D shapes - edge"
    (test-case "cube-volume of 0 is 0" (check-equal? (cube-volume 0) 0))
    (test-case "sphere-volume of radius 0 is 0" (check-equal? (sphere-volume 0) 0))
    (test-case "sphere-volume-lst maps over a list"
      (check-equal? (sphere-volume-lst '(0 1)) (list (sphere-volume 0) (sphere-volume 1)))))

   (test-suite
    "lines - valid"
    (test-case "line-segment-midpoint of (0,0) and (6,8)"
      (check-equal? (line-segment-midpoint (cons 0 0) (cons 6 8)) (cons 3 4)))
    (test-case "line-segment-length is the classic 3-4-5 hypotenuse"
      (check-equal? (line-segment-length (cons 0 0) (cons 3 4)) 5))
    (test-case "linear-interpolate at mu=0.5 is the midpoint"
      (check-equal? (linear-interpolate 0 10 0.5) 5.0))
    (test-case "cosine-interpolate at mu=0.5 matches linear at the midpoint"
      (check-within (cosine-interpolate 0 10 0.5) 5.0 0.001)))

   (test-suite
    "lines - edge"
    (test-case "linear-interpolate at mu=0 returns y1" (check-equal? (linear-interpolate 3 9 0) 3))
    (test-case "linear-interpolate at mu=1 returns y2" (check-equal? (linear-interpolate 3 9 1) 9))
    (test-case "line-segment-length of identical points is 0"
      (check-equal? (line-segment-length (cons 2 2) (cons 2 2)) 0)))

   (test-suite
    "pi approximation - valid"
    (test-case "pi-value approximates pi closely" (check-within (pi-value) pi 0.001))
    (test-case "area-of-polygon approximates pi for a large n"
      (check-within (area-of-polygon 10000) pi 0.01)))

   (test-suite
    "pi approximation - edge"
    (test-case "area-of-polygon returns a real number" (check-pred real? (area-of-polygon 100))))

   (test-suite
    "log.txt-spec aliases - valid"
    (test-case "area-circle is an alias of circle-area" (check-equal? (area-circle 2) (circle-area 2)))
    (test-case "circumference-circle is an alias of circle-circum" (check-equal? (circumference-circle 2) (circle-circum 2)))
    (test-case "area-square is an alias of sqr-area" (check-equal? (area-square 5) (sqr-area 5)))
    (test-case "perimeter-square is an alias of sqr-perim" (check-equal? (perimeter-square 5) (sqr-perim 5)))
    (test-case "area-rectangle is an alias of rectangle-area" (check-equal? (area-rectangle 4 5) (rectangle-area 4 5)))
    (test-case "perimeter-rectangle is an alias of rectangle-perim" (check-equal? (perimeter-rectangle 4 5) (rectangle-perim 4 5)))
    (test-case "area-triangle is an alias of area-of-triangle" (check-equal? (area-triangle 4 3) (area-of-triangle 4 3)))
    (test-case "perimeter-triangle sums the three sides" (check-equal? (perimeter-triangle 3 4 5) 12))
    (test-case "volume-cube is an alias of cube-volume" (check-equal? (volume-cube 3) (cube-volume 3)))
    (test-case "volume-sphere is an alias of sphere-volume" (check-equal? (volume-sphere 3) (sphere-volume 3)))
    (test-case "volume-cylinder is an alias of cylindrical-barrel-volume" (check-equal? (volume-cylinder 2 5) (cylindrical-barrel-volume 2 5)))
    (test-case "volume-cone is an alias of right-circular-cone-volume" (check-equal? (volume-cone 3 4) (right-circular-cone-volume 3 4))))))

(run-tests geometry-tests)
