#lang racket

;; Math Module
;; Re-exports all math submodules

(require "algebra/main.rkt"
         "arithmetic/main.rkt"
         "combinatorics/main.rkt"
         "financial/main.rkt"
         "geometry/main.rkt"
         "matrix/main.rkt"
         "number-theory/main.rkt"
         "statistics/main.rkt"
         "trigonometry/main.rkt")

(provide (all-from-out "algebra/main.rkt")
         (all-from-out "arithmetic/main.rkt")
         (all-from-out "combinatorics/main.rkt")
         (all-from-out "financial/main.rkt")
         (all-from-out "geometry/main.rkt")
         (all-from-out "matrix/main.rkt")
         (all-from-out "number-theory/main.rkt")
         (all-from-out "statistics/main.rkt")
         (all-from-out "trigonometry/main.rkt"))
