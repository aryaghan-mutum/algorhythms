#lang racket

;;Author: Anurag Muthyam
;;The function returns a list of elements based on the numbering.

(define (nth-cdr n L)
  (if (zero? n)
      L
      (nth-cdr (- n 1) (cdr L))))

