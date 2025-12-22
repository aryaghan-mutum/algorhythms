#lang racket

;; Math Module Aggregator
;; Re-exports all math submodules for convenient importing

(require "algebra/algebra.rkt"
         "arithmetic/arithmetic.rkt"
         "combinatorics/combinatorics.rkt"
         "geometry/geometry.rkt"
         "number-theory/number-theory.rkt"
         "statistics/statistics.rkt"
         "trigonometry/trigonometry.rkt")

(provide (all-from-out "algebra/algebra.rkt")
         (all-from-out "arithmetic/arithmetic.rkt")
         (all-from-out "combinatorics/combinatorics.rkt")
         (all-from-out "geometry/geometry.rkt")
         (all-from-out "number-theory/number-theory.rkt")
         (all-from-out "statistics/statistics.rkt")
         (all-from-out "trigonometry/trigonometry.rkt"))
