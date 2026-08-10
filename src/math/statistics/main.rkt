#lang racket

;; Statistics Module
;; Re-exports all statistics functions

(require "find-avg-excluding-first-and-last.rkt")

(provide (all-from-out "find-avg-excluding-first-and-last.rkt"))
