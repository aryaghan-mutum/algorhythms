#lang racket

;;Author: Anurag Muthyam
;; The process:

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

(copy-tree-m1 '())            ;'()
(copy-tree-m1 '(1 3 5))       ;'(1 3 5)
(copy-tree-m1 '(a c e))       ;'(a c e)


