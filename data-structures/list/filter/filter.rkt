#lang racket

;; filter function taken from https://courses.cs.washington.edu/courses/cse341/15au/racket/basics.html

(define (my-filter fn n)
  (cond ((null? n) null)
        ((fn (car n)) (cons (car n) (my-filter fn (cdr n))))
        (else (my-filter fn (cdr n)))))

(my-filter (lambda (n) (> n 10)) '(5 10 15 20))