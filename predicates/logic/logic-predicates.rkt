;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#lang racket
(require rackunit)
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

;; Tests
(check-true (true? #t))
(check-false (true? #f))
(check-false (true? 1))

(check-true (false? #f))
(check-false (false? #t))
(check-false (false? 0))

(check-true (boolean-custom? #t))
(check-true (boolean-custom? #f))
(check-false (boolean-custom? 1))
