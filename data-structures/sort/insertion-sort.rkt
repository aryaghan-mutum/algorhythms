;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require rackunit)
(provide insert-sort-v1)

;; insertion sort version 1
(define (insert-sort-v1 lst)
  (if (empty? lst)
      '()
      (insert-sort-v1-helper (car lst)
                             (insert-sort-v1 (cdr lst)))))

(define (insert-sort-v1-helper n lst)
  (if (empty? lst)
      (cons n '())
      (if (<= n (car lst))
          (cons n lst)
          (cons (car lst) (insert-sort-v1-helper n (cdr lst))))))

(check-equal? (insert-sort-v1 '()) '())
(check-equal? (insert-sort-v1 '(1)) '(1))
(check-equal? (insert-sort-v1 '(4 32.2 43.4 -912.2 0 2)) '(-912.2 0 2 4 32.2 43.4))
(check-equal? (insert-sort-v1 '(1 -9 32 321 21 0)) '(-9 0 1 21 32 321))
