#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; Reference: http://paulbourke.net/miscellaneous/interpolation/

(provide linear-interpolate
         cosine-interpolate)

;; Linear interpolation between y1 and y2 at fraction mu in [0, 1].
;; linear-interpolate : real? real? real? -> real?
(define (linear-interpolate y1 y2 mu)
  (+ (* y1 (- 1 mu))
     (* y2 mu)))

;; Cosine interpolation between y1 and y2 at fraction mu in [0, 1] (smoother).
;; cosine-interpolate : real? real? real? -> real?
(define (cosine-interpolate y1 y2 mu)
  (let ((mu2 (/ (- 1 (cos (* mu pi))) 2)))
    (linear-interpolate y1 y2 mu2)))
