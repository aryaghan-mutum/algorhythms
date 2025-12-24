#lang racket

;; Encoding Module
;; Re-exports all encoding functions

(require "morse-code.rkt")

(provide (all-from-out "morse-code.rkt"))
