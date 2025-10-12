#lang info

(define name "algorhythms")
(define version "0.1.0")
(define deps '("rackunit"))
(define build-deps '("scribble-lib" "racket-doc"))
(define scribblings '(("docs/algorhythms.scrbl" (multi-page))))
(define pkg-desc "Collection of algorithm implementations")
(define pkg-authors '("Anurag Muthyam"))
(define license 'BSD-3-Clause)
