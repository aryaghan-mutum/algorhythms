#lang racket

;; Author: Anurag Muthyam
;; Matrix determinant via cofactor expansion along row 0.

(provide matrix-determinant
         matrix-minor)

;; matrix-minor : matrix? integer? integer? -> matrix?
;; removes row i and column j
(define (matrix-minor m i j)
  (define rows-without-i
    (append (take m i) (drop m (add1 i))))
  (map (lambda (row) (append (take row j) (drop row (add1 j)))) rows-without-i))

;; matrix-determinant : matrix? -> number?
(define (matrix-determinant m)
  (define n (length m))
  (cond [(= n 1) (car (car m))]
        [(= n 2) (- (* (list-ref (list-ref m 0) 0) (list-ref (list-ref m 1) 1))
                    (* (list-ref (list-ref m 0) 1) (list-ref (list-ref m 1) 0)))]
        [else
         (for/sum ([j (in-range n)])
           (* (if (even? j) 1 -1)
              (list-ref (list-ref m 0) j)
              (matrix-determinant (matrix-minor m 0 j))))]))
