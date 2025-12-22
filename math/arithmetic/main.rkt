#lang racket

;; Arithmetic - Main Module
;; Aggregates arithmetic operations

(require "cube.rkt"
         "square.rkt"
         "abs.rkt"
         "powers.rkt"
         "roots.rkt"
         "fractions.rkt"
         "decimals.rkt"
         "percentages.rkt")

(provide (all-from-out "cube.rkt")
         (all-from-out "square.rkt")
         (all-from-out "abs.rkt")
         (all-from-out "powers.rkt")
         (all-from-out "roots.rkt")
         (all-from-out "fractions.rkt")
         (all-from-out "decimals.rkt")
         (all-from-out "percentages.rkt"))
