#lang racket

;;Author: Anurag Muthyam

;; tr = (1 3 5)
;; if tr is empty, then return tr
;; else: (cons (copy-tree-m1 (car tr)) (copy-tree-m1 (cdr tr)))))


(define (atom? x)
  (not (pair? x)))

(define (copy-tree-m1 tr)
  (if (atom? tr)
      tr
      (cons (copy-tree-m1 (car tr))
            (copy-tree-m1 (cdr tr)))))

