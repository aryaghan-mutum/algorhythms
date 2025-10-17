#lang racket
;; Collection module for the algorhythms package.
;; Re-export the API from your implementation files so
;; (require algorhythms) will provide these names.

;; Require the implementation files (paths relative to package root)
(require "dev/math/combinatorics/factorial.rkt"
         "dev/encoding/morse-code.rkt")

;; Re-export everything you want available to users:
(provide (all-from-out "dev/math/combinatorics/factorial.rkt")
         (all-from-out "dev/encoding/morse-code.rkt"))
