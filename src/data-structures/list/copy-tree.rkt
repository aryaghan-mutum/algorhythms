;; Author: Anurag Muthyam

#lang racket
(provide copy-tree)

;; =================

;; recursive process
(define (copy-tree tr)
  (if (not (pair? tr))
      tr
      (cons (copy-tree (car tr))
            (copy-tree (cdr tr)))))

;; Alternative implementation kept for reference (commented out) --
;; copy-tree above is the active implementation (no unnecessary local helper).
#|
(define (copy-tree-v1 tr)
  (define (atom? x) (not (pair? x)))
  (if (atom? tr)
      tr
      (cons (copy-tree-v1 (car tr))
            (copy-tree-v1 (cdr tr)))))
|#