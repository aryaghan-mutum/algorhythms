;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#lang racket
(require rackunit racket/trace threading)
(provide quadratic-formula-v1 quadratic-formula-v2)

;; =================

;; using let*
(define (quadratic-formula-v1 a b c)
  (let* ((minusb (- 0 b))
         (radical (sqrt (- (sqr b) (* 4 (* a c)))))
         (divisor (* 2 a))
         (root1 (/ (+ minusb radical) divisor))
         (root2 (/ (- minusb radical) divisor)))
    (cons root1 root2)))

;; =================

;; using set!
(define (quadratic-formula-v2 a b c)
  (let ((root1 0) (root2 0) (minusb 0) (radical 0) (divisor 0))
    (set! minusb (- 0 b))
    (set! radical (sqrt (- (sqr b) (* 4 (* a c)))))
    (set! divisor (* 2 a))
    (set! root1 (/ (+ minusb radical) divisor))
    (set! root2 (/ (- minusb radical) divisor))
    (cons root1 root2)))