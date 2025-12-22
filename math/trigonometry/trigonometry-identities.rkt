#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum/racket-predicates
;; Trignometric Identities

(require "./trigonometry.rkt")
(provide sin-cos-identity?
         tan-sec-identity?
         cot-cosec-identity?)

;; trignometric identity for sin^2(𝜃) + cos^2(𝜃) = 1
(define sin-cos-identity?
  (lambda (x)
    (= 1.0 (+ (sqr (sine x))
              (sqr (cosine x))))))

;; trignometric identity for tan^2(𝜃) + 1 = sec^2(𝜃)
(define tan-sec-identity?
  (lambda (x)
    (= (sqr (secant x))
       (+ (sqr (tangent x)) 1))))

;; trignometric identity for cot^2(𝜃) + 1 = cosec^2(𝜃)
(define cot-cosec-identity?
  (lambda (x)
    (= (+ 1 (sqr (cotangent x)))
       (+ (sqr (cosecant x)) 1))))
