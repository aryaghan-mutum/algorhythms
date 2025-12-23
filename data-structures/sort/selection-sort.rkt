;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require rackunit racket/contract)

(provide
  (contract-out
    [selection-sort-v1 (-> list? list?)]))

;; selection sort version 1
(define (selection-sort-v1 lst)
  (define (selection-sort-helper rsf lst)
    (cond ((empty? lst) rsf)
          (else (define minimum (smallest lst))
                (selection-sort-helper (cons minimum rsf)
                                       (remove minimum lst)))))
  (selection-sort-helper '() lst))

(define (smallest lst)
  (define (smallest-helper frst lst)
    (if (empty? lst)
        frst
        (if (> frst (car lst))
            (smallest-helper frst (cdr lst))
            (smallest-helper (car lst) (cdr lst)))))
  (smallest-helper (car lst) (cdr lst)))

(check-equal? (selection-sort-v1 '()) '())
(check-equal? (selection-sort-v1 '(1)) '(1))
(check-equal? (selection-sort-v1 '(4 32.2 43.4 -912.2 0 2)) '(-912.2 0 2 4 32.2 43.4))
(check-equal? (selection-sort-v1 '(1 -9 32 321 21 0)) '(-9 0 1 21 32 321))
