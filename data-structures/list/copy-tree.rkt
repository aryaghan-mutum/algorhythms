;; Author: Anurag Muthyam

#lang racket
(provide copy-tree-v1 copy-tree-v2)

;; =================

;; recurisve process using atom? version 1
(define (copy-tree-v1 tr)
  (define (atom? x) (not (pair? x)))
  (if (atom? tr)
      tr
      (cons (copy-tree-v1 (car tr))
            (copy-tree-v1 (cdr tr)))))

;; recurisve process using atom? version 2
(define (copy-tree-v2 tr)
  (if (not (pair? tr))
      tr
      (cons (copy-tree-v2 (car tr))
            (copy-tree-v2 (cdr tr)))))