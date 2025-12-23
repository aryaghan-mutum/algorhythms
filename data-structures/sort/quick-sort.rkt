;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require rackunit racket/contract)

(provide
  (contract-out
    [quick-sort-v1 (-> list? procedure? list?)]))

;; quicksort using match, curry and let-values version 1
(define (quick-sort-v1 lst fn)
  (match lst
    ('() '())
    ((cons x xs)
     (let-values (((xs-gte xs-lt) (partition (curry fn x) xs)))
       (append (quick-sort-v1 xs-lt fn)
               (list x)
               (quick-sort-v1 xs-gte fn))))))

(check-equal? (quick-sort-v1 '(1) <) '(1))
(check-equal? (quick-sort-v1 '(4 32.2 43.4 -912.2 0 2) <) '(-912.2 0 2 4 32.2 43.4))
(check-equal? (quick-sort-v1 '(1 -9 32 321 21 0) <) '(-9 0 1 21 32 321))
