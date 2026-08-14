#lang racket

;;Author: Anurag Muthyam

; input: number
; output: list

(define (range n)
  (range-aux n null))

(define (range-aux n L)
  (if (= n 0) L
      (range-aux (- n 1) (cons n L))))
