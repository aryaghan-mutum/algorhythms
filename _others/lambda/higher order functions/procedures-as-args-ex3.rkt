#lang racket

;; pass functions as arguments 

(define (compare a b f)
  (if (f a b) a b))

(define (max a b)
  (compare a b >))

(define (min a b)
  (compare a b <))

(max 2 3)
(min 22 3)