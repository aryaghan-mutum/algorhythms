;; Author: Anurag Muthyam

#lang racket

(provide area-of-polygon-v1 
         area-of-polygon-v2 
         pi-value)

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