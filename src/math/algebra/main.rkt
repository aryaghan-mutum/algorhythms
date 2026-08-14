#lang racket

;; Algebra Module
;; Re-exports all algebra functions

(require "expt.rkt"
         "polynomial.rkt"
         "quadratic-formula.rkt"
         "solve-linear.rkt"
         "mutable-matrix.rkt")

(provide (all-from-out "expt.rkt")
         (all-from-out "polynomial.rkt")
         (all-from-out "quadratic-formula.rkt")
         (all-from-out "solve-linear.rkt")
         (all-from-out "mutable-matrix.rkt"))
