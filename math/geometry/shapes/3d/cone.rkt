#lang racket

;; Author: Anurag Muthyam

(require rackunit)
(provide cone-area
         cone-volume)

;; area of cone
(define cone-area
  (λ (rad slant-height)
    (* pi rad slant-height)))

;; cone/pyramid volume
(define cone-volume
  (λ (b h)
    (/ (* b h) 3)))

;; Tests
(check-= (cone-area 3 5) (* pi 3 5) 0.001)
(check-equal? (cone-volume 9 6) 18)
