#lang racket

;; Higher-Order Functions Module
;; Re-exports all HOF implementations

(require "map.rkt"
         "filter.rkt"
         "foldr.rkt"
         "foldl.rkt"
         "reduce.rkt"
         "flatten.rkt"
         "flatmap.rkt"
         "foreach.rkt"
         "take-while.rkt"
         "partition.rkt"
         "zip-with.rkt"
         "compose.rkt"
         "curry.rkt"
         "flip.rkt"
         "scan.rkt")

(provide 
  ;; Core HOFs
  mapper           ; map function over list
  filter-custom    ; filter list by predicate
  reduce           ; reduce list to single value
  foldl-custom     ; left fold
  foldr-custom     ; right fold
  foreach          ; apply function to each element
  flatmap          ; flatten nested lists
  
  ;; List transformations
  take-while       ; take while predicate true
  drop-while       ; drop while predicate true
  partition-list   ; split list by predicate
  zip-with         ; combine two lists with function
  scan             ; intermediate accumulator values
  
  ;; Function utilities
  compose-fns      ; compose functions (right to left)
  pipe             ; pipe functions (left to right)
  curry2           ; curry 2-arg function
  partial          ; partial application
  flip             ; flip argument order
  constantly       ; constant function
  
  ;; Re-export flatten
  (all-from-out "flatten.rkt"))
