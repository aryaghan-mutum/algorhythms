#lang racket


;; area and permi of rectangle

(define (area-rect len wid)
  (* len wid))

(define (perim-rect len wid)
  (+ (* 2 len)
     (* 2 wid)))

;; Volume of a Rectangular Solid
(define (vol-of-rect-solid l w h)
  (* l w h))


;; Surface Area of a Rectangular Solid
(define (surface-area-of-sphere l w h)
  (* 2 (+ (* l w)
          (* h w)
          (* h l))))
