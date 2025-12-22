#lang racket

;; Author: Anurag Muthyam
;; Rational Numbers: Operations on rational numbers

(provide add-rational
         multiply-rational
         make-rational
         rational-numerator
         rational-denominator)

;; Create a rational number from numerator and denominator
;; make-rational : integer? integer? -> pair?
(define (make-rational numer denom)
  (let ([g (gcd numer denom)])
    (cons (/ numer g) (/ denom g))))

;; Get numerator of a rational number
;; rational-numerator : pair? -> integer?
(define (rational-numerator x)
  (car x))

;; Get denominator of a rational number
;; rational-denominator : pair? -> integer?
(define (rational-denominator x)
  (cdr x))

;; Add two rational numbers
;; add-rational : pair? pair? -> pair?
(define (add-rational x y)
  (let ([n (+ (* (rational-numerator x) (rational-denominator y))
              (* (rational-numerator y) (rational-denominator x)))]
        [d (* (rational-denominator x) (rational-denominator y))])
    (make-rational n d)))

;; Multiply two rational numbers
;; multiply-rational : pair? pair? -> pair?
(define (multiply-rational x y)
  (let ([n (* (rational-numerator x) (rational-numerator y))]
        [d (* (rational-denominator x) (rational-denominator y))])
    (make-rational n d)))
