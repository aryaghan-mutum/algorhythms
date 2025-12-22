;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket

(require rackunit)
(provide area-of-polygon-v1 area-of-polygon-v2 pi-value)

;; calculate pi value version 1
(define (area-of-polygon-v1 n)
  (define-values (angle div) (values (sin (/ 360 n)) (/ n 2)))
  (* div angle))

;; calculate pi value version 2
(define (area-of-polygon-v2 n)
  (define-values (angle div) (values (sin (/ (* 2 pi) n)) (/ n 2)))
  (* div angle))

;; calcualate pi values taken and modifed from SICP page 54:
(define (pi-value)
  (define-values (a b) (values 1.0 10000))
  (define (pi-term x) (/ 1 (* x (+ x 2))))
  (define (pi-next x) (+ x 4))
  (define (sum fn-term a fn-next b)
    (cond ((> a b) 0)
          (else (+ (fn-term a)
                   (sum fn-term (fn-next a) fn-next b)))))
  (* 8 (sum pi-term a pi-next b)))

(check-eqv? (area-of-polygon-v1 100) -22.126022164742622)
(check-eqv? (area-of-polygon-v2 100) 3.1395259764656687)
(check-eqv? (pi-value) 3.141392653591793)
