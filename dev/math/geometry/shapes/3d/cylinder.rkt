#lang racket

;; Author: Anurag Muthyam

(require rackunit)
(provide cylindrical-barrel-volume)

;; volume of cylindrical barrel
(define cylindrical-barrel-volume
  (λ (r h)
    (* pi (sqr r) h)))

;; Tests
(check-= (cylindrical-barrel-volume 2 5) (* pi 4 5) 0.001)
