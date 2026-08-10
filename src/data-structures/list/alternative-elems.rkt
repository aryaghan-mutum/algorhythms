;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require rackunit)
(provide alternative-elems)

;; get alternative elements from a list
;; taken from "A Micro-Manual For Lisp - Not The Whole Truth"
(define (alternative-elems lst)
  (if (or (empty? lst) (empty? (cdr lst)))
      lst
      (cons (car lst) (alternative-elems (cddr lst)))))

(check-equal? (alternative-elems '()) '())
(check-equal? (alternative-elems '(1)) '(1))
(check-equal? (alternative-elems '(1 2)) '(1))
(check-equal? (alternative-elems '(1 2 3)) '(1 3))
(check-equal? (alternative-elems '(1 2 3 4)) '(1 3))
(check-equal? (alternative-elems '(1 2 3 4 5)) '(1 3 5))
