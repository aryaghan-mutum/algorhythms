#lang racket

;; Author: Anurag Muthyam
;; Matrix transposition (list-of-lists representation).

(provide matrix-transpose)

;; matrix-transpose : matrix? -> matrix?
(define (matrix-transpose m)
  (apply map list m))
