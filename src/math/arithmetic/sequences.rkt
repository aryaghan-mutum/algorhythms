#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide arithmetic-seq-sum
         geometric-seq-sum)

;; Sum of the first n terms of an arithmetic sequence with first term x1 and last term xn.
;; arithmetic-seq-sum : real? real? exact-positive-integer? -> real?
(define (arithmetic-seq-sum x1 xn n)
  (* (/ (+ x1 xn) 2) n))

;; Sum of the first n terms of a geometric sequence with first term x and common ratio r (r != 1).
;; geometric-seq-sum : real? (and/c real? (not/c (=/c 1))) exact-positive-integer? -> real?
(define (geometric-seq-sum x r n)
  (let ((numer (- 1 (expt r n)))
        (denom (- 1 r)))
    (/ (* x numer) denom)))

    
    
    