#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; Higher-Order Functions module: re-exports all HOF implementations.

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
         "scan.rkt"
         "complement.rkt"
         "identity.rkt"
         "counter.rkt"
         "lazy.rkt"
         "memoize.rkt")

(provide
  mapper
  filter-custom
  reduce
  foldl-custom
  foldr-custom
  foreach
  flatmap
  flatten-list
  take-while
  drop-while
  partition-list
  zip-with
  scan
  compose-fns
  pipe
  curry2
  partial
  flip
  constantly
  complement
  identity
  make-counter
  lazy
  memoize)
