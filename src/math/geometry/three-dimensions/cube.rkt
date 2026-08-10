#lang racket

;; Author: Anurag Mthyam

(provide cube-volume
         (rename-out [cube-volume volume-cube]))

;; volume of cube 
(define cube-volume
  (lambda (s) (* s s s)))

