#lang racket

;; Author: Anurag Mthyam

(provide sphere-volume
         sphere-volume-lst
         sphere-area
         sphere-area-lst)

;; volume of sphere
(define sphere-volume
  (λ (r) (* 4/3 pi (* r r r))))

;; volume of sphere for each elemement in a list
(define sphere-volume-lst
  (λ (lst) (map sphere-volume lst)))

;; area of sphere 
(define sphere-area
  (λ (r) (* 4 * pi (sqr r))))

;; area of sphere for each elemement in a list
(define sphere-area-lst
  (λ (lst) (map sphere-area lst)))
