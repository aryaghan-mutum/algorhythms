#lang racket

;; Matrices Module
;; Re-exports all matrix operations

(require "matrix.rkt"
         "transpose.rkt")

(provide (all-from-out "matrix.rkt")
         (all-from-out "transpose.rkt"))
