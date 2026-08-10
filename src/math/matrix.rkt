#lang racket

;; Author: Anurag Muthyam
;; Matrix operations. Matrices are represented as a list of row-lists,
;; e.g. '((1 2) (3 4)) is a 2x2 matrix.

(provide matrix-add
         matrix-subtract
         matrix-multiply
         matrix-transpose
         matrix-determinant
         matrix-inverse
         identity-matrix)

;; matrix-add : matrix? matrix? -> matrix?
(define (matrix-add m1 m2)
  (map (lambda (row1 row2) (map + row1 row2)) m1 m2))

;; matrix-subtract : matrix? matrix? -> matrix?
(define (matrix-subtract m1 m2)
  (map (lambda (row1 row2) (map - row1 row2)) m1 m2))

;; matrix-transpose : matrix? -> matrix?
(define (matrix-transpose m)
  (apply map list m))

;; matrix-multiply : matrix? matrix? -> matrix?
(define (matrix-multiply m1 m2)
  (define m2-cols (matrix-transpose m2))
  (map (lambda (row)
         (map (lambda (col) (apply + (map * row col))) m2-cols))
       m1))

;; identity-matrix : integer? -> matrix?
(define (identity-matrix n)
  (for/list ([i (in-range n)])
    (for/list ([j (in-range n)])
      (if (= i j) 1 0))))

;; minor : matrix? integer? integer? -> matrix?
;; removes row i and column j (used by determinant/inverse cofactor expansion)
(define (minor m i j)
  (define rows-without-i
    (append (take m i) (drop m (add1 i))))
  (map (lambda (row) (append (take row j) (drop row (add1 j)))) rows-without-i))

;; matrix-determinant : matrix? -> number? (cofactor expansion along row 0)
(define (matrix-determinant m)
  (define n (length m))
  (cond [(= n 1) (car (car m))]
        [(= n 2) (- (* (list-ref (list-ref m 0) 0) (list-ref (list-ref m 1) 1))
                    (* (list-ref (list-ref m 0) 1) (list-ref (list-ref m 1) 0)))]
        [else
         (for/sum ([j (in-range n)])
           (* (if (even? j) 1 -1)
              (list-ref (list-ref m 0) j)
              (matrix-determinant (minor m 0 j))))]))

;; matrix-inverse : matrix? -> matrix? (classical adjoint / determinant method)
(define (matrix-inverse m)
  (define n (length m))
  (define det (matrix-determinant m))
  (define cofactors
    (for/list ([i (in-range n)])
      (for/list ([j (in-range n)])
        (* (if (even? (+ i j)) 1 -1) (matrix-determinant (minor m i j))))))
  (define adjugate (matrix-transpose cofactors))
  (map (lambda (row) (map (lambda (x) (/ x det)) row)) adjugate))
