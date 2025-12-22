#lang racket

;; Author: Anurag Mthyam

(provide cone-area
         cone-volume)

;; area of cone 
(define cone-area
  (λ (rad slant-height)
    (pi * rad * slant-height)))

;; cone/pyramid volume  
(define cone-volume
  (λ (b h)
    (/ (* b h) 3)))
