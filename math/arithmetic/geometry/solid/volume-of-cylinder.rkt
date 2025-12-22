#lang racket

;; find Volume of a cylindrical barrel
(define (volume rad height)
  (* pi (sqr rad) height))

(volume 2 4)

