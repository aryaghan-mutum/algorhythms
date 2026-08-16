#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide sphere-volume
         sphere-volume-lst
         sphere-area
         sphere-area-lst
         (rename-out [sphere-volume volume-sphere]))

;; Volume of a sphere of radius r: (4/3) π r^3.
;; sphere-volume : real? -> real?
(define (sphere-volume r) (* 4/3 pi (* r r r)))

;; sphere-volume mapped over a list of radii.
;; sphere-volume-lst : (listof real?) -> (listof real?)
(define (sphere-volume-lst lst) (map sphere-volume lst))

;; Surface area of a sphere of radius r: 4 π r^2.
;; sphere-area : real? -> real?
(define (sphere-area r) (* 4 pi (sqr r)))

;; sphere-area mapped over a list of radii.
;; sphere-area-lst : (listof real?) -> (listof real?)
(define (sphere-area-lst lst) (map sphere-area lst))
