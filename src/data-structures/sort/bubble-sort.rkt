#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require racket/contract)

(provide
  (contract-out
    [bubble-sort (-> list? (-> any/c any/c any/c) list?)]))

;; Bubble sort using comparator `less?`: (less? a b) => #t means a comes before b.
;; Passing `<` yields ascending order for numbers.
;; bubble-sort : list? (any/c any/c -> boolean?) -> list?
(define (bubble-sort lst less?)
  (define (one-pass lst)
    (cond ((or (empty? lst) (empty? (cdr lst))) lst)
          ((less? (car lst) (cadr lst))
           (cons (car lst) (one-pass (cdr lst))))
          (else
           (cons (cadr lst) (one-pass (cons (car lst) (cddr lst)))))))
  (let ((next (one-pass lst)))
    (if (equal? lst next)
        lst
        (bubble-sort next less?))))
