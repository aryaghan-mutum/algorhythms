#lang racket

;; Algorhythms - A Racket library of algorithms and data structures
;; Author: Anurag Muthyam

(require racket/contract)

;; Core modules - using main.rkt aggregators
(require "math/main.rkt"
         "data-structures/main.rkt"
         "encoding/main.rkt"
         "private/main.rkt")

(provide 
  ;; Math (includes arithmetic, algebra, combinatorics, geometry, number-theory, statistics, trigonometry)
  (all-from-out "math/main.rkt")
  
  ;; Data Structures (includes hof, sort, list, set, string, queue, stack)
  (all-from-out "data-structures/main.rkt")
  
  ;; Encoding
  (all-from-out "encoding/main.rkt")
  
  ;; Utilities
  (contract-out
    [memoize (-> procedure? procedure?)]
    [lazy (-> procedure? procedure?)]))