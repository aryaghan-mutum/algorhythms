#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require "../combinatorics/factorial.rkt")

(provide sine
         cosine
         tangent
         cotangent
         secant
         cosecant)

;; Sine of x (radians) via Taylor series; the optional 2nd arg is the internal
;; term index used by the recursion and should not be passed by callers.
;; sine : real? [exact-nonnegative-integer?] -> real?
(define (sine x . n)
  (cond ((not (empty? n))
         (cond ((< 25 (car n)) 0)
               (else (- (/ (expt x (car n)) (factorial (car n)))
                        (sine x (+ 2 (car n)))))))
        (else (- x (sine x 3)))))

;; Cosine of x (radians) via the identity cos(x) = sin(pi/2 - x).
;; cosine : real? -> real?
(define (cosine x)
  (sine (- (/ pi 2) x)))

;; Tangent of x (radians): sin(x) / cos(x).
;; tangent : real? -> real?
(define (tangent x)
  (/ (sine x) (cosine x)))

;; Cotangent of x (radians): cos(x) / sin(x).
;; cotangent : real? -> real?
(define (cotangent x)
  (/ (cosine x) (sine x)))

;; Secant of x (radians): 1 / cos(x).
;; secant : real? -> real?
(define (secant x)
  (/ (cosine x)))

;; Cosecant of x (radians): 1 / sin(x).
;; cosecant : real? -> real?
(define (cosecant x)
  (/ (sine x)))
