#lang racket

;; Author: Anurag Muthyam
;; Matrix multiplication (list-of-lists representation).

(require (only-in "transpose.rkt" matrix-transpose))

(provide matrix-multiply)

;; matrix-multiply : matrix? matrix? -> matrix?
(define (matrix-multiply m1 m2)
  (define m2-cols (matrix-transpose m2))
  (map (lambda (row)
         (map (lambda (col) (apply + (map * row col))) m2-cols))
       m1))
