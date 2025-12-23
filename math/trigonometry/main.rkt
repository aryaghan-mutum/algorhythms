#lang racket

;; Trigonometry Module
;; Re-exports all trigonometry functions
;; Note: trigonometry.rkt contains the primary implementations

(require "trigonometry.rkt"
         "double-angle-identities.rkt"
         "inverse-trigonometry.rkt"
         "product-identities.rkt"
         "sum-and-difference-identities.rkt"
         "sum-to-product-identities.rkt"
         "trigonometry-identities.rkt")

(provide (all-from-out "trigonometry.rkt")
         (all-from-out "double-angle-identities.rkt")
         (all-from-out "inverse-trigonometry.rkt")
         (all-from-out "product-identities.rkt")
         (all-from-out "sum-and-difference-identities.rkt")
         (all-from-out "sum-to-product-identities.rkt")
         (all-from-out "trigonometry-identities.rkt"))
