#lang racket

;; trapezoid

(define (area-trapezoid a b height)
  (* 0.5
     (+ a b)
     height))
