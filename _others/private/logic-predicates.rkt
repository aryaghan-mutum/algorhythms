;; Author: Anurag Muthyam

#lang racket

(provide true? 
         false? 
         boolean-custom?)
         
;; check if x is true 
(define (true? x) (eq? x #t))

;; check if x is false 
(define (false? x) (eq? x #f))

;; check if x is a boolean expression 
(define (boolean-custom? x)
  (or (eq? x #t) (eq? x #f)))