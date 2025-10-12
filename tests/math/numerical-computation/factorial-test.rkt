#lang racket

(require rackunit "../../../dev/math/numerical-computation/factorial.rkt")

(check-equal? (factorial 0) 1)
(check-equal? (factorial 5) 120)
