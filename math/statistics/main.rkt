#lang racket

;; Statistics Module
;; Re-exports all statistics functions

(require "complement.rkt"
         "find-avg-excluding-first-and-last.rkt"
         "identity.rkt"
         "nth.rkt"
         "rotations.rkt")

(provide (all-from-out "complement.rkt")
         (all-from-out "find-avg-excluding-first-and-last.rkt")
         (all-from-out "identity.rkt")
         (all-from-out "nth.rkt")
         (all-from-out "rotations.rkt"))
