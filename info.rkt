#lang info

(define name "algorhythms")
(define version "0.3.0")
(define deps '(("base" #:version "8.14") "rackunit-lib" "threading"))
(define build-deps '("scribble-lib" "racket-doc" "rackunit-lib"))
(define scribblings '(("scribblings/algorhythms.scrbl" ())))
(define pkg-desc "A collection of implementations for algorithms and data structures in Racket.")
(define pkg-authors '("Anurag Muthyam"))
(define license 'BSD-3-Clause)
(define categories '("algorithms" "data-structures"))

;; Installs `bin/cli.rkt` as the `algorhythms` command-line executable
(define racket-launcher-names '("algorhythms"))
(define racket-launcher-libraries '("bin/cli.rkt"))

;; Exclude folders from compilation and tests; bin/ is compiled so the launcher above can run
(define compile-omit-paths '("src/_others" "doc" "examples"))
(define test-omit-paths '("src/_others" "doc" "examples" "scribblings" "bin"))
