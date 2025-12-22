#lang racket

;; Arithmetic Module Aggregator
;; Re-exports all arithmetic functions for convenient importing

(require "abs.rkt"
         "add1.rkt"
         "cube.rkt"
         "double.rkt"
         "fractions.rkt"
         "half.rkt"
         "min-max.rkt"
         "power.rkt"
         "reciprocal.rkt"
         "remainder.rkt"
         "square.rkt"
         "sub1.rkt"
         "sum.rkt")

(provide (all-from-out "abs.rkt")
         (all-from-out "add1.rkt")
         (all-from-out "cube.rkt")
         (all-from-out "double.rkt")
         (all-from-out "fractions.rkt")
         (all-from-out "half.rkt")
         (all-from-out "min-max.rkt")
         (all-from-out "power.rkt")
         (all-from-out "reciprocal.rkt")
         (all-from-out "remainder.rkt")
         (all-from-out "square.rkt")
         (all-from-out "sub1.rkt")
         (all-from-out "sum.rkt"))
