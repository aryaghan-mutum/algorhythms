#lang racket

;; Statistics Module
;; Re-exports all statistics functions

(require "central-tendency.rkt"
         "dispersion.rkt"
         "extremes.rkt"
         "percentile.rkt"
         "find-avg-excluding-first-and-last.rkt")

(provide (all-from-out "central-tendency.rkt")
         (all-from-out "dispersion.rkt")
         (all-from-out "extremes.rkt")
         (all-from-out "percentile.rkt")
         (all-from-out "find-avg-excluding-first-and-last.rkt"))
