#lang racket

;; Author: Anurag Muthyam
;; Element-wise matrix addition and subtraction.
;; Matrices are represented as a list of row-lists, e.g. '((1 2) (3 4)).

(provide matrix-add
         matrix-subtract)

;; matrix-add : matrix? matrix? -> matrix?
(define (matrix-add m1 m2)
  (map (lambda (row1 row2) (map + row1 row2)) m1 m2))

;; matrix-subtract : matrix? matrix? -> matrix?
(define (matrix-subtract m1 m2)
  (map (lambda (row1 row2) (map - row1 row2)) m1 m2))
