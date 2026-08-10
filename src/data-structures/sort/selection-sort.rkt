;; Author: Anurag Muthyam

#lang racket
(require racket/contract)

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
