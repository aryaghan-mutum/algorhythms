;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

;; A mutable vector-of-vectors matrix data structure (Kent Dybvig, The Scheme
;; Programming Language). Distinct from src/math/matrix/'s immutable list-of-lists
;; representation and algebraic operations (add, multiply, transpose, etc.).

#lang racket
(provide make-matrix
         matrix-rows
         matrix-cols
         matrix-ref
         matrix-set!)

;; make-matrix : exact-nonnegative-integer? exact-nonnegative-integer? [any/c] -> matrix?
(define (make-matrix rows columns . value)
  (do ((m (make-vector rows)) (i 0 (add1 i)))
      ((= i rows) m)
    (if (empty? value)
        (vector-set! m i (make-vector columns))
        (vector-set! m i (make-vector columns (car value))))))

;; matrix-rows : matrix? -> exact-nonnegative-integer?
(define (matrix-rows x)
  (vector-length x))

;; matrix-cols : matrix? -> exact-nonnegative-integer?
(define (matrix-cols x)
  (vector-length (vector-ref x 0)))

;; matrix-ref : matrix? exact-nonnegative-integer? exact-nonnegative-integer? -> any/c
(define (matrix-ref m i j)
  (vector-ref (vector-ref m i) j))

;; matrix-set! : matrix? exact-nonnegative-integer? exact-nonnegative-integer? any/c -> void?
(define (matrix-set! m i j x)
  (vector-set! (vector-ref m i) j x))
