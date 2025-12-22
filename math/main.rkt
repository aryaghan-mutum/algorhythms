#lang racket

;; Math - Main Module
;; Aggregates commonly used mathematical operations

(require "combinatorics/factorial.rkt"
         "number-theory/primes.rkt"
         "number-theory/gcd.rkt"
         "number-theory/lcm.rkt"
         "arithmetic/cube.rkt"
         "arithmetic/square.rkt")

(provide (all-from-out "combinatorics/factorial.rkt")
         (all-from-out "number-theory/primes.rkt")
         (all-from-out "number-theory/gcd.rkt")
         (all-from-out "number-theory/lcm.rkt")
         (all-from-out "arithmetic/cube.rkt")
         (all-from-out "arithmetic/square.rkt"))
