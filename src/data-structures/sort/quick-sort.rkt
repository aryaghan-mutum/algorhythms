#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require racket/contract)

(provide
  (contract-out
    [quick-sort (-> list? (-> any/c any/c any/c) list?)]))

;; Quicksort using comparator `less?`; (less? a b) => #t means a precedes b.
;; Passing `<` yields ascending order for numbers.
;; quick-sort : list? (any/c any/c -> boolean?) -> list?
(define (quick-sort lst less?)
  (match lst
    ('() '())
    ((cons pivot rest)
     (let-values (((geq lt) (partition (curry less? pivot) rest)))
       (append (quick-sort lt less?)
               (list pivot)
               (quick-sort geq less?))))))
