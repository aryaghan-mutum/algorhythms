;; Author: Anurag Muthyam
;; Reciprocal Trigonometry
;; Note: these compute 1/fn(x)-style reciprocals, not true inverse (arc-) functions

#lang racket

(require "./trigonometry.rkt")
(provide reciprocal-sin
         reciprocal-cos
         reciprocal-tan
         reciprocal-cosec
         reciprocal-sec
         reciprocal-cot)

;; reciprocal of sin: -(1/sin(x))
(define reciprocal-sin
  (lambda (x)
    (- (/ 1 (sine x)))))

;; reciprocal of cos: π - (1/sin(x))
(define reciprocal-cos
  (lambda (x)
    (- pi (/ 1 (sine x)))))

;; reciprocal of tan: -(1/tan(x))
(define reciprocal-tan
  (lambda (x)
    (- (/ 1 (tangent x)))))

;; reciprocal of cosec: -(1/cosec(x))
(define reciprocal-cosec
  (lambda (x)
    (- (/ 1 (cosecant x)))))

;; reciprocal of sec: -(1/sec(x))
(define reciprocal-sec
  (lambda (x)
    (- (/ 1 (secant x)))))

;; reciprocal of cot: π - (1/cot(x))
(define reciprocal-cot
  (lambda (x)
    (- pi (/ 1 (cotangent x)))))
