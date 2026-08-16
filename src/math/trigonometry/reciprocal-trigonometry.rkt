#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require "./trigonometry.rkt")

(provide reciprocal-sin
         reciprocal-cos
         reciprocal-tan
         reciprocal-cosec
         reciprocal-sec
         reciprocal-cot)

;; Reciprocal of sine: 1 / sin(x) (equals cosecant(x)).
;; reciprocal-sin : real? -> real?
(define (reciprocal-sin x) (/ 1 (sine x)))

;; Reciprocal of cosine: 1 / cos(x) (equals secant(x)).
;; reciprocal-cos : real? -> real?
(define (reciprocal-cos x) (/ 1 (cosine x)))

;; Reciprocal of tangent: 1 / tan(x) (equals cotangent(x)).
;; reciprocal-tan : real? -> real?
(define (reciprocal-tan x) (/ 1 (tangent x)))

;; Reciprocal of cosecant: 1 / cosec(x) (equals sin(x)).
;; reciprocal-cosec : real? -> real?
(define (reciprocal-cosec x) (/ 1 (cosecant x)))

;; Reciprocal of secant: 1 / sec(x) (equals cos(x)).
;; reciprocal-sec : real? -> real?
(define (reciprocal-sec x) (/ 1 (secant x)))

;; Reciprocal of cotangent: 1 / cot(x) (equals tan(x)).
;; reciprocal-cot : real? -> real?
(define (reciprocal-cot x) (/ 1 (cotangent x)))
