#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide cube-volume
         (rename-out [cube-volume volume-cube]))

;; Volume of a cube with side length s.
;; cube-volume : real? -> real?
(define (cube-volume s) (* s s s))
