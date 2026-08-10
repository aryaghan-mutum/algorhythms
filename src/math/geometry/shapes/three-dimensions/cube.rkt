#lang racket

;; Author: Anurag Muthyam

(require rackunit)
(provide cube-volume)

;; volume of cube
(define cube-volume
  (lambda (s) (* s s s)))
