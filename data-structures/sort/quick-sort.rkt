;; Author: Anurag Muthyam

#lang racket
(require racket/contract)

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
