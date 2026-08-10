#lang racket

;; Author: Anurag Muthyam
;; Identity matrix generation.

(provide identity-matrix)

;; identity-matrix : integer? -> matrix?
(define (identity-matrix n)
  (for/list ([i (in-range n)])
    (for/list ([j (in-range n)])
      (if (= i j) 1 0))))
