#lang racket

(define (reciprocal n)
  (/ 1 n))

(define (div-fractions a b)
  (* a (reciprocal b)))

(div-fractions 1/6 1/3)
(div-fractions 5 7/3)