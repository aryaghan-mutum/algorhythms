;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

;; Scheme provides one-dimensional arrays, which it calls vectors, but no two-dimensional arrays.
;; Kent Dybvig provides a matrix data structure defined as a vector of vectors in The Scheme Programming Language:

#lang racket
(require rackunit racket/trace)
(provide make-matrix
         matrix-rows
         matrix-cols
         matrix-ref
         matrix-set!)

(define (make-matrix rows columns . value)
  (do ((m (make-vector rows)) (i 0 (add1 i)))
      ((= i rows) m)
    (if (empty? value)
        (vector-set! m i (make-vector columns))
        (vector-set! m i (make-vector columns (car value))))))

(define (matrix-rows x)
  (vector-length x))

(define (matrix-cols x)
  (vector-length (vector-ref x 0)))

(define (matrix-ref m i j)
  (vector-ref (vector-ref m i) j))

(define (matrix-set! m i j x)
  (vector-set! (vector-ref m i) j x))

(define (transpose lst)
  (list (map car lst) (map cdr lst)))