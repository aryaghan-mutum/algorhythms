#lang racket

;; Geometry Module
;; Re-exports all geometry functions

(require "geometry.rkt"
         "pythagoras.rkt"
         "angles.rkt"
         "coordinate-geometry.rkt"
         "plane-geometry.rkt"
         "solid-geometry.rkt"
         "2d-geometry/main.rkt"
         "3d-geometry/main.rkt")

(provide (all-from-out "geometry.rkt")
         (all-from-out "pythagoras.rkt")
         (all-from-out "angles.rkt")
         (all-from-out "coordinate-geometry.rkt")
         (all-from-out "plane-geometry.rkt")
         (all-from-out "solid-geometry.rkt")
         (all-from-out "2d-geometry/main.rkt")
         (all-from-out "3d-geometry/main.rkt"))
