#lang racket

;; Author: Anurag Muthyam
;; Filter procedure 

(provide my-filter
         filter-iter)

(define (my-filter fn lst)
  (cond ((empty? lst) '())
        ((fn (car lst)) (cons (car lst) (my-filter fn (cdr lst))))
        (else (my-filter fn (cdr lst)))))

;; filter using iterative process
(define (filter-iter proc lst)
  (define (filter-loop lst rlst)
    (cond ((empty? lst) rlst)
          ((proc (car lst)) (filter-loop (cdr lst)
                                         (cons (car lst) rlst)))
          (else (filter-loop (cdr lst) rlst))))
  (reverse (filter-loop lst '())))