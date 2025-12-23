;; Author: Anurag Muthyam

#lang racket

(require threading)

;; get a nested lists of negative and positive numbers
(define (separate-neg-and-pos lst)
  (define (aux lst nlst plst)
    (cond ((empty? lst) (list (sort nlst <) (sort plst <)))
          ((negative? (car lst)) (aux (cdr lst) (cons (car lst) nlst) plst))
          (else (aux (cdr lst) nlst (cons (car lst) plst)))))
  (aux lst '() '()))

(define (neg-lst lst)
  (~> lst
      (separate-neg-and-pos _)
      (car _)))

(define (pos-lst lst)
  (~> lst
      (separate-neg-and-pos _)
      (last _)))
