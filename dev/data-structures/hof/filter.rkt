#lang racket

;; Author: Anurag Muthyam
;; Filter procedure 

(provide filter)

(define (filter fn lst)
  (cond ((empty? lst) '())
        ((fn (car lst)) (cons (car lst) (filter fn (cdr lst))))
        (else (filter fn (cdr lst)))))