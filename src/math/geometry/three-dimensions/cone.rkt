#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide cone-area
         cone-volume)

;; Lateral surface area of a cone: π * radius * slant-height.
;; cone-area : real? real? -> real?
(define (cone-area rad slant-height)
  (* pi rad slant-height))

;; Generic pyramid/cone volume: (base * height) / 3.
;; cone-volume : real? real? -> real?
(define (cone-volume b h)
  (/ (* b h) 3))
