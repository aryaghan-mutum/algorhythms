;; Author: Anurag Muthyam

#lang racket
(require racket/contract)

(provide
  (contract-out
    [insert-sort-v1 (-> list? list?)]))

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
