#lang racket

;; Author: Anurag Muthyam

(require rackunit)
(provide sphere-volume
         sphere-volume-lst
         sphere-area
         sphere-area-lst)

;; volume of sphere
(define sphere-volume
  (lambda (r) (* 4/3 pi (* r r r))))

;; volume of sphere for each element in a list
(define sphere-volume-lst
  (lambda (lst) (map sphere-volume lst)))

;; area of sphere
(define sphere-area
  (lambda (r) (* 4 pi (sqr r))))

;; area of sphere for each element in a list
(define sphere-area-lst
  (lambda (lst) (map sphere-area lst)))

;; Tests
(check-= (sphere-volume 1) (* 4/3 pi) 0.001)
(check-= (sphere-area 1) (* 4 pi) 0.001)
