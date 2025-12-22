#lang racket

(define (area-circle r)
  (* pi (sqr r)))

(define (circum-circle r)
  (* 2 pi r))

;; Arclength and Area of a Circular Sector

(define (arc-len rad angle)
  (* rad angle))

(define (area-arc-len rad angle)
  (* 0.5 (sqr r) angle))
