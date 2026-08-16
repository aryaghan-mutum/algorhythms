#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide compress)

;; Collapse consecutive equal elements to a single occurrence (like Unix `uniq`).
;; compress : list? -> list?
(define (compress lst [acc '()])
  (if (>= (length lst) 2)
      (if (equal? (car lst) (cadr lst))
          (compress (cdr lst) acc)
          (compress (cdr lst) (append acc (list (car lst)))))
      (append acc lst)))
