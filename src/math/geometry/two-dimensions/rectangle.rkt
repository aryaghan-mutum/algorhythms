#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide rectangle-area
         rectangle-area-lst
         rectangle-perim
         rectangle-perm-lst
         rectangle-volume
         rectangle-volume-lst
         rectangle-area-solid
         rectangle-area-solid-lst
         (rename-out [rectangle-area area-rectangle]
                     [rectangle-perim perimeter-rectangle]))

;; Area of a rectangle: length * width.
;; rectangle-area : real? real? -> real?
(define (rectangle-area len wid) (* len wid))

;; rectangle-area mapped over a list of (length width) pairs.
;; rectangle-area-lst : (listof (list real? real?)) -> (listof real?)
(define (rectangle-area-lst lst) (map rectangle-area lst))

;; Perimeter of a rectangle: 2*(length + width).
;; rectangle-perim : real? real? -> real?
(define (rectangle-perim len wid)
  (+ (* 2 len) (* 2 wid)))

;; rectangle-perim mapped over a list of (length width) pairs.
;; rectangle-perm-lst : (listof (list real? real?)) -> (listof real?)
(define (rectangle-perm-lst lst) (map rectangle-perim lst))

;; Volume of a rectangular solid: l * w * h.
;; rectangle-volume : real? real? real? -> real?
(define (rectangle-volume l w h) (* l w h))

;; rectangle-volume mapped over a list of (l w h) triples.
;; rectangle-volume-lst : (listof (list real? real? real?)) -> (listof real?)
(define (rectangle-volume-lst lst) (map rectangle-volume lst))

;; Surface area of a rectangular solid: 2*(lw + wh + lh).
;; rectangle-area-solid : real? real? real? -> real?
(define (rectangle-area-solid l w h)
  (* 2 (+ (* l w) (* h w) (* h l))))

;; rectangle-area-solid mapped over a list of (l w h) triples.
;; rectangle-area-solid-lst : (listof (list real? real? real?)) -> (listof real?)
(define (rectangle-area-solid-lst lst) (map rectangle-area-solid lst))
