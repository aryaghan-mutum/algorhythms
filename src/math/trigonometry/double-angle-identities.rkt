;; Author: Anurag Muthyam
;; Double Angle Identities
;; Note: y is accepted but unused in every identity below -- these are single-angle
;; formulas (2x in terms of x alone). Kept for API-shape consistency with the sibling
;; identity files here that do need both x and y; not changed to avoid an arity break.

#lang racket

(require "./trigonometry.rkt")
(provide sin2x
         tan2x
         sec2x
         cosec2x)

;; double angle identity for sin(2x)
(define sin2x
  (lambda (x y)
    (* 2 (sine x) (cosine x))))

;; double angle identity for tan(2x)
(define tan2x
  (lambda (x y)
    (/ (* 2 (tangent x))
       (- 1 (sqr (tangent x))))))

;; double angle identity for sec(2x)
(define sec2x
  (lambda (x y)
    (/ (sqr (secant x))
       (- 2 (sqr (secant x))))))

;; double angle identity for cosec(2x)
(define cosec2x
  (lambda (x y)
    (/ (* (secant x)
          (cosecant x)) 2)))
