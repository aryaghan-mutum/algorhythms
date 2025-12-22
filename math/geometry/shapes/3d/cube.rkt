#lang racket

;; Author: Anurag Muthyam

(require rackunit)
(provide cube-volume)

;; volume of cube
(define cube-volume
  (λ (s) (* s s s)))

;; Tests
(check-equal? (cube-volume 3) 27)
(check-equal? (cube-volume 4) 64)
