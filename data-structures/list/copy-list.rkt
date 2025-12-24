;; Author: Anurag Muthyam

#lang racket

(provide copy-list-v1 copy-list-v2 copy-list-v3)

;; get the copied list using iterative process version 1
(define (copy-list-v1 lst)
  (define (copy-list-iter lst rlst)
    (if (empty? lst)
        (reverse rlst)
        (copy-list-iter (cdr lst)
                        (cons (car lst) rlst))))
  (copy-list-iter lst '()))

;; get the copied list using recurisve process version 2
(define (copy-list-v2 lst)
  (if (empty? lst)
      lst
      (cons (car lst) (copy-list-v2 (cdr lst)))))

;; get the copied list using recurisve process using atom? version 3
(define (copy-list-v3 lst)
  (define (atom? x) (not (pair? x)))
  (if (atom? lst)
      lst
      (cons (car lst) (copy-list-v3 (cdr lst)))))