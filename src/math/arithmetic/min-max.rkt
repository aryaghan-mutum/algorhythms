#lang racket

;; Author: Anurag Muthyam

(provide min
         max)

;; get a mininum between two numbers 
(define min
  (lambda (a b)
    (if (< a b) a b)))

;; get a maximum between two numbers   
(define max
  (lambda (a b)
    (if (> a b) a b)))

;; get a minimumor maximum between two numbers base on the function
(define min-max
  (lambda (a b f)
    (if (f a b) a b)))