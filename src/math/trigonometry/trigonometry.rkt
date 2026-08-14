#lang racket

;; Author: Anurag Muthyam

(require "../combinatorics/factorial.rkt")

(provide sine
         cosine
         tangent
         cotangent
         secant
         cosecant)

;; sin θ = Opposite Side/Hypotenuse
(define (sine x . n)
  (cond ((not (empty? n))
         (cond ((< 25 (car n)) 0)
               (else (- (/ (expt x (car n)) (factorial (car n)))
                        (sine x (+ 2 (car n)))))))
        (else (- x (sine x 3)))))

;; cos θ = Adjacent Side/Hypotenuse
(define (cosine x)
  (sine (- (/ pi 2) x)))

;; tan θ = Opposite Side/Adjacent Side
(define (tangent x)
  (/ (sine x) (cosine x)))

;; cot θ = Adjacent Side/Opposite Side
(define (cotangent x)
  (/ (cosine x) (sine x)))

;; sec θ = Hypotenuse/Adjacent Side
(define (secant x)
  (/ (cosine x)))

;; cosec θ = Hypotenuse/Opposite Side
(define (cosecant x)
  (/ (sine x)))


