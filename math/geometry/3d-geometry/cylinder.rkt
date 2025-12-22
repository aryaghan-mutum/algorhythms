#lang racket

;; Author: Anurag Muthyam

(provide cylindrical-barrel-volume)

;; volume of cylindrical barrel
(define cylindrical-barrel-volume
  (λ (r h)
    (* pi (sqr r) h)))
