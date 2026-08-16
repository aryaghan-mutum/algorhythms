#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide cylindrical-barrel-volume
         (rename-out [cylindrical-barrel-volume volume-cylinder]))

;; Volume of a cylindrical barrel: π r^2 h.
;; cylindrical-barrel-volume : real? real? -> real?
(define (cylindrical-barrel-volume r h)
  (* pi (sqr r) h))
