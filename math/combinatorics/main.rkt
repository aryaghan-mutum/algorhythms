#lang racket

;; Combinatorics Module
;; Re-exports all combinatorics functions

(require "factorial.rkt")

(provide (all-from-out "factorial.rkt"))
