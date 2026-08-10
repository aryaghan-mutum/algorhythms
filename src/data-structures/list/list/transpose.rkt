#lang racket

(define transpose
  (lambda (ls)
    (cons (map car ls) (map cdr ls))))