#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide copy-tree)

;; Return a fresh cons-tree with the same structure and leaves as `tr`.
;; copy-tree : any/c -> any/c
(define (copy-tree tr)
  (if (not (pair? tr))
      tr
      (cons (copy-tree (car tr))
            (copy-tree (cdr tr)))))
