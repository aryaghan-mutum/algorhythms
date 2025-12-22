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

(check-equal? (make-matrix 2 3) '#(#(0 0 0) #(0 0 0)))
(check-equal? (make-matrix 0 3) '#())
(check-equal? (make-matrix 3 0) '#(#() #() #()))
(check-equal? (make-matrix 2 3 4) '#(#(4 4 4) #(4 4 4)))
(check-equal? (make-matrix 2 3 'a) '#(#(a a a) #(a a a)))

(check-equal? (matrix-rows (make-matrix 2 3)) 2)
(check-equal? (matrix-rows (make-matrix 0 3)) 0)
(check-equal? (matrix-rows (make-matrix 3 0)) 3)
(check-equal? (matrix-rows (make-matrix 2 3 4)) 2)
(check-equal? (matrix-rows (make-matrix 2 3 'a)) 2)

(check-equal? (matrix-cols (make-matrix 2 3)) 3)
(check-equal? (matrix-cols (make-matrix 3 0)) 0)
(check-equal? (matrix-cols (make-matrix 2 3 4)) 3)
(check-equal? (matrix-cols (make-matrix 2 3 'a)) 3)
