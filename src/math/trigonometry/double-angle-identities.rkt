#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require "./trigonometry.rkt")

(provide sin2x
         tan2x
         sec2x
         cosec2x)

;; Double-angle identity: sin(2x) = 2 sin(x) cos(x).
;; sin2x : real? -> real?
(define (sin2x x)
  (* 2 (sine x) (cosine x)))

;; Double-angle identity: tan(2x) = 2 tan(x) / (1 - tan^2(x)).
;; tan2x : real? -> real?
(define (tan2x x)
  (/ (* 2 (tangent x))
     (- 1 (sqr (tangent x)))))

;; Double-angle identity: sec(2x) = sec^2(x) / (2 - sec^2(x)).
;; sec2x : real? -> real?
(define (sec2x x)
  (/ (sqr (secant x))
     (- 2 (sqr (secant x)))))

;; Double-angle identity: cosec(2x) = sec(x) cosec(x) / 2.
;; cosec2x : real? -> real?
(define (cosec2x x)
  (/ (* (secant x) (cosecant x)) 2))
