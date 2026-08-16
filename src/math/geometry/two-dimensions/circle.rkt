#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide circle-area
         circle-area-lst
         circle-circum
         circle-circum-lst
         circle-arc-length
         circle-arc-length-lst
         circle-arc-len
         circle-arc-len-lst
         (rename-out [circle-area area-circle]
                     [circle-circum circumference-circle]))

;; Area of a circle of radius r: \u03c0 r^2.
;; circle-area : real? -> real?
(define (circle-area r) (* pi (sqr r)))

;; circle-area mapped over a list of radii.
;; circle-area-lst : (listof real?) -> (listof real?)
(define (circle-area-lst lst) (map circle-area lst))

;; Circumference of a circle of radius r: 2 \u03c0 r.
;; circle-circum : real? -> real?
(define (circle-circum r) (* 2 pi r))

;; circle-circum mapped over a list of radii.
;; circle-circum-lst : (listof real?) -> (listof real?)
(define (circle-circum-lst lst) (map circle-circum lst))

;; Arc length: r * angle-in-radians (linear arc, not sector area).
;; circle-arc-length : real? real? -> real?
(define (circle-arc-length rad angle) (* rad angle))

;; circle-arc-length mapped over a list of (radius angle) pairs.
;; circle-arc-length-lst : (listof (list real? real?)) -> (listof real?)
(define (circle-arc-length-lst lst) (map circle-arc-length lst))

;; Area of a circular sector: 0.5 * r^2 * angle-in-radians.
;; circle-arc-len : real? real? -> real?
(define (circle-arc-len r angle) (* 0.5 (sqr r) angle))

;; circle-arc-len mapped over a list of (radius angle) pairs.
;; circle-arc-len-lst : (listof (list real? real?)) -> (listof real?)
(define (circle-arc-len-lst lst) (map circle-arc-len lst))
