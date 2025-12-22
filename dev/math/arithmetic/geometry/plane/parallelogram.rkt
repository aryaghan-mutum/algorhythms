#lang racket

;; area of parallelogram

(define (area-parallelogram base height)
  (* base height))

(define (perim-parallelogram base height)
  (+ (* 2 base)
     (* 2 height)))

