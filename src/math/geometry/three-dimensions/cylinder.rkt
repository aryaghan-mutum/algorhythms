#lang racket

;; Author: Anurag Muthyam

(provide cylindrical-barrel-volume
         (rename-out [cylindrical-barrel-volume volume-cylinder]))

;; volume of cylindrical barrel
(define cylindrical-barrel-volume
  (lambda (r h)
    (* pi (sqr r) h)))
