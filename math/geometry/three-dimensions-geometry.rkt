#lang racket

;; Author: Anurag Muthyam
;; 3D Geometry Functions

(provide sphere-area
         sphere-volume
         cube-volume
         cone-area
         cone-volume
         right-circular-cone-volume
         cylindrical-barrel-volume)

;; area of sphere
(define sphere-area (lambda (r) (* 4 pi (sqr r))))

;; volume of sphere
(define sphere-volume (lambda (r) (* 4/3 pi (* r r r))))

;; volume of a cube
(define cube-volume (lambda (s) (* s s s)))

;; area of cone
(define cone-area
  (lambda (rad slant-height)
    (pi * rad * slant-height)))

;; cone/pyramid volume
(define cone-volume
  (lambda (b h)
    (/ (* b h) 3)))

;; volume of right circular cone
(define right-circular-cone-volume
  (lambda (r h)
    (* 1/3 pi (sqr r) h)))

;; volume of cylindrical barrel
(define cylindrical-barrel-volume
  (lambda (r h)
    (* pi (sqr r) h)))

;; area of trapezoid
(define trapezoid-area
  (lambda (a b h) (* 0.5 (+ a b) h)))

