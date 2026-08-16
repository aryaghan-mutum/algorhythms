#lang racket

; store functions in a data structure

(define (f fn)
  (list fn 2))

(f sqr)