#lang racket

;; Algebra Module
;; Re-exports all algebra functions

(require "expt.rkt"
         "quadratic-formula.rkt")

(provide (all-from-out "expt.rkt")
         (all-from-out "quadratic-formula.rkt"))
