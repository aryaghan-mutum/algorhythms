#lang info

(define name "algorhythms")
(define version "0.1.0")
(define deps '("rackunit"))
(define build-deps '("scribble-lib" "racket-doc"))
(define scribblings '(("docs/algorhythms.scrbl" (multi-page))))
(define pkg-desc "A collection of implementations for algorithms and data structures in Racket.")
(define pkg-authors '("Anurag Muthyam"))
(define license 'BSD-3-Clause)
(define categories '(algorithms data-structures))
