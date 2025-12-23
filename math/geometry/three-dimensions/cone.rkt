#lang racket

;; Author: Anurag Mthyam

(provide cone-area
         cone-volume)

;; area of cone 
(define cone-area
  (lambda (rad slant-height)
    (pi * rad * slant-height)))

;; cone/pyramid volume  
(define cone-volume
  (lambda (b h)
    (/ (* b h) 3)))
