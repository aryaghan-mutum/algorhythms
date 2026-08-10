#lang racket

;; Algorhythms - A Racket library of algorithms and data structures
;; Author: Anurag Muthyam

;; Core modules - using main.rkt aggregators
(require "src/math/main.rkt"
         "src/data-structures/main.rkt"
         "src/encoding/main.rkt")

(provide 
  ;; Math (includes arithmetic, algebra, combinatorics, geometry, number-theory, statistics, trigonometry)
  (all-from-out "src/math/main.rkt")
  
  ;; Data Structures (includes hof, sort, list, set, string, queue, stack)
  (all-from-out "src/data-structures/main.rkt")
  
  ;; Encoding
  (all-from-out "src/encoding/main.rkt"))