#lang racket

;; sphere

;; volume of a sphere

(define (cube n) (* n n n))
(define (vol-sphere r)
  (* 4/3 pi (cube r)))

(define (surface-area r)
  (* 4 * pi (sqr r)))

