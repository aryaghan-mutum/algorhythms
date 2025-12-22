#lang info

(define name "algorhythms")
(define version "0.3.0")
(define deps '("base" "rackunit-lib" "threading"))
(define build-deps '("scribble-lib" "racket-doc" "rackunit-lib"))
(define scribblings '(("scribblings/algorhythms.scrbl" ())))
(define pkg-desc "A collection of implementations for algorithms and data structures in Racket.")
(define pkg-authors '("Anurag Muthyam"))
(define license 'BSD-3-Clause)
(define categories '("algorithms" "data-structures"))
