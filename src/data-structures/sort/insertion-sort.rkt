#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require racket/contract)

(provide
  (contract-out
    [insertion-sort (-> (listof real?) (listof real?))]))

;; Insertion sort using `<=`; produces ascending order for a list of numbers.
;; insertion-sort : (listof real?) -> (listof real?)
(define (insertion-sort lst)
  (define (insert n sorted)
    (cond ((empty? sorted) (list n))
          ((<= n (car sorted)) (cons n sorted))
          (else (cons (car sorted) (insert n (cdr sorted))))))
  (if (empty? lst)
      '()
      (insert (car lst) (insertion-sort (cdr lst)))))
