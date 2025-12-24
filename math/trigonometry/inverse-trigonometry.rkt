;; Author: Anurag Muthyam
;; Inverse Trignometry

#lang racket

(require "./trigonometry.rkt")
(provide sin-inverse
         cos-inverse
         tan-inverse
         tan-inverse
         sec-inverse
         cot-inverse)

;; inverse trignometry for sin^-1 (–x)
(define sin-inverse
  (lambda (x)
    (- (/ 1 (sine x)))))

;; inverse trignometry for cos^-1 (–x)
(define cos-inverse
  (lambda (x)
    (- pi (/ 1 (sine x)))))

;; inverse trignometry for tan^-1 (–x)
(define tan-inverse
  (lambda (x)
    (- (/ 1 (tangent x)))))

;; inverse trignometry for cosec^-1 (–x)
(define cosec-inverse
  (lambda (x)
    (- (/ 1 (cosecant x)))))

;; inverse trignometry for sec^-1 (–x)
(define sec-inverse
  (lambda (x)
    (- (/ 1 (secant x)))))

;; inverse trignometry for cot^-1 (–x)
(define cot-inverse
  (lambda (x)
    (- pi (/ 1 (cotangent x)))))
