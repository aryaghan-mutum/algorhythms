#lang racket

;; Matrices Module Aggregator
;; Re-exports all matrix operations for convenient importing

(require "matrix.rkt"
         "transpose.rkt")

(provide (all-from-out "matrix.rkt")
         (all-from-out "transpose.rkt"))
