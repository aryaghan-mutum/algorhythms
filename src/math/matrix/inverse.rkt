#lang racket

;; Author: Anurag Muthyam
;; Matrix inverse via the classical adjoint (cofactor / determinant) method.

(require (only-in "determinant.rkt" matrix-determinant matrix-minor)
         (only-in "transpose.rkt" matrix-transpose))

(provide matrix-inverse)

;; matrix-inverse : matrix? -> matrix?
(define (matrix-inverse m)
  (define n (length m))
  (define det (matrix-determinant m))
  (define cofactors
    (for/list ([i (in-range n)])
      (for/list ([j (in-range n)])
        (* (if (even? (+ i j)) 1 -1) (matrix-determinant (matrix-minor m i j))))))
  (define adjugate (matrix-transpose cofactors))
  (map (lambda (row) (map (lambda (x) (/ x det)) row)) adjugate))
