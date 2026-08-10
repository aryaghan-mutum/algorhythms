#lang racket

;; Matrix Module
;; Re-exports all matrix operations

(require "basic-ops.rkt"
         "multiply.rkt"
         "transpose.rkt"
         "determinant.rkt"
         "inverse.rkt"
         "identity.rkt")

(provide (all-from-out "basic-ops.rkt")
         (all-from-out "multiply.rkt")
         (all-from-out "transpose.rkt")
         (all-from-out "determinant.rkt")
         (all-from-out "inverse.rkt")
         (all-from-out "identity.rkt"))
