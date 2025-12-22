#lang racket

;; Author: Anurag Muthyam
;; Filter procedure 

(provide my-filter)

(define (my-filter fn lst)
  (cond ((empty? lst) '())
        ((fn (car lst)) (cons (car lst) (my-filter fn (cdr lst))))
        (else (my-filter fn (cdr lst)))))