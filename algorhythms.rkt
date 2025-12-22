#lang racket

;; Algorhythms - A Racket library of algorithms and data structures
;; Author: Anurag Muthyam

(require racket/contract)

;; Core modules - using aggregators for cleaner imports
(require "math/math.rkt"
         "data-structures/data-structures.rkt"
         "encoding/morse-code.rkt"
         "private/memoize.rkt"
         "private/lazy.rkt")

(provide 
  ;; Math (includes arithmetic, algebra, combinatorics, geometry, number-theory, statistics, trigonometry)
  (all-from-out "math/math.rkt")
  
  ;; Data Structures (includes hof, sort, queue, stack)
  (all-from-out "data-structures/data-structures.rkt")
  
  ;; Encoding
  (all-from-out "encoding/morse-code.rkt")
  
  ;; Utilities
  (contract-out
    [memoize (-> procedure? procedure?)]
    [lazy (-> procedure? procedure?)]))