#lang racket

;; Logarithms Module
;; Re-exports all logarithm functions

(require "log-custom.rkt")

(provide (all-from-out "log-custom.rkt"))
