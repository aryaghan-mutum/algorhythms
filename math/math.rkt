#lang racket

;; Math Module Aggregator
;; Re-exports all math submodules for convenient importing

(require "arithmetic/arithmetic.rkt"
         "combinatorics/combinatorics.rkt"
         "number-theory/number-theory.rkt")

(provide (all-from-out "arithmetic/arithmetic.rkt")
         (all-from-out "combinatorics/combinatorics.rkt")
         (all-from-out "number-theory/number-theory.rkt"))
