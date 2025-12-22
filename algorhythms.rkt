#lang racket

;; Algorhythms - A Racket library of algorithms and data structures
;; Author: Anurag Muthyam

;; Core modules
(require "math/combinatorics/factorial.rkt"
         "math/number-theory/primes.rkt"
         "math/number-theory/gcd.rkt"
         "math/number-theory/lcm.rkt"
         "math/number-theory/prime-factorization.rkt"
         "math/arithmetic/cube.rkt"
         "math/arithmetic/square.rkt"
         "math/arithmetic/abs.rkt"
         "data-structures/hof/filter.rkt"
         "data-structures/hof/reduce.rkt"
         "data-structures/hof/foldr.rkt"
         "data-structures/hof/flatten.rkt"
         "data-structures/hof/flatmap.rkt"
         "data-structures/list/length.rkt"
         "data-structures/list/last.rkt"
         "encoding/morse-code.rkt")

(provide 
  ;; Math - Combinatorics
  (all-from-out "math/combinatorics/factorial.rkt")
  
  ;; Math - Number Theory
  (all-from-out "math/number-theory/primes.rkt")
  (all-from-out "math/number-theory/gcd.rkt")
  (all-from-out "math/number-theory/lcm.rkt")
  (all-from-out "math/number-theory/prime-factorization.rkt")
  
  ;; Math - Arithmetic
  (all-from-out "math/arithmetic/cube.rkt")
  (all-from-out "math/arithmetic/square.rkt")
  (all-from-out "math/arithmetic/abs.rkt")
  
  ;; Data Structures - Higher Order Functions
  (all-from-out "data-structures/hof/filter.rkt")
  (all-from-out "data-structures/hof/reduce.rkt")
  (all-from-out "data-structures/hof/foldr.rkt")
  (all-from-out "data-structures/hof/flatten.rkt")
  (all-from-out "data-structures/hof/flatmap.rkt")
  
  ;; Data Structures - List
  (all-from-out "data-structures/list/length.rkt")
  (all-from-out "data-structures/list/last.rkt")
  
  ;; Encoding
  (all-from-out "encoding/morse-code.rkt"))