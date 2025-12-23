#lang racket

;; Set Operations Module
;; Re-exports all set functions

(require "set.rkt"
         "set-union.rkt"
         "set-intersection.rkt"
         "compress.rkt"
         "duplicates-by-elem.rkt"
         "duplicates-by-function.rkt"
         "set-move-elem-to-last.rkt")

(provide (all-from-out "set.rkt")
         (all-from-out "set-union.rkt")
         (all-from-out "set-intersection.rkt")
         (all-from-out "compress.rkt")
         (all-from-out "duplicates-by-elem.rkt")
         (all-from-out "duplicates-by-function.rkt")
         (all-from-out "set-move-elem-to-last.rkt"))
