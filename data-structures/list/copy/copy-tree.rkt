;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

;; get the copied tree

#lang racket
(require rackunit)
(provide copy-tree-v1 copy-tree-v2)

;; =================

;; recurisve process using atom? version 1
(define (copy-tree-v1 tr)
  (define (atom? x) (not (pair? x)))
  (if (atom? tr)
      tr
      (cons (copy-tree-v1 (car tr))
            (copy-tree-v1 (cdr tr)))))

;; =================

;; recurisve process using atom? version 2
(define (copy-tree-v2 tr)
  (if (not (pair? tr))
      tr
      (cons (copy-tree-v2 (car tr))
            (copy-tree-v2 (cdr tr)))))

;; =================

(check-equal? (copy-tree-v1 '()) '())
(check-equal? (copy-tree-v1 '(a)) '(a))
(check-equal? (copy-tree-v1 '(a b)) '(a b))
(check-equal? (copy-tree-v1 '(a b 1 2)) '(a b 1 2))
(check-equal? (copy-tree-v1 '(a b '(1 2))) '(a b '(1 2)))
(check-equal? (copy-tree-v1 '((a . b) .c)) '((a . b) .c))
(check-equal? (copy-tree-v1 '((a . b) . (c . d))) '((a . b) c . d))

(check-equal? (copy-tree-v2 '()) '())
(check-equal? (copy-tree-v2 '(a)) '(a))
(check-equal? (copy-tree-v2 '(a b)) '(a b))
(check-equal? (copy-tree-v2 '(a b 1 2)) '(a b 1 2))
(check-equal? (copy-tree-v2 '(a b '(1 2))) '(a b '(1 2)))
(check-equal? (copy-tree-v2 '((a . b) .c)) '((a . b) .c))
(check-equal? (copy-tree-v2 '((a . b) . (c . d))) '((a . b) c . d))
