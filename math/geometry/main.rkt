#lang racket

;; Geometry Module
;; Re-exports all geometry functions

(require "geometry.rkt"
         "pythagoras.rkt"
         "angles.rkt"
         "coordinate-geometry.rkt"
         "plane-geometry.rkt"
         "solid-geometry.rkt"
         "two-dimensions/main.rkt"
         "three-dimensions/main.rkt")

(provide (all-from-out "geometry.rkt")
         (all-from-out "pythagoras.rkt")
         (all-from-out "angles.rkt")
         (all-from-out "coordinate-geometry.rkt")
         (all-from-out "plane-geometry.rkt")
         (all-from-out "solid-geometry.rkt")
         (all-from-out "two-dimensions/main.rkt")
         (all-from-out "three-dimensions/main.rkt"))
