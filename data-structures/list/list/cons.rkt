#lang racket

(define (my-cons x y)
  (if (empty? x)
      y
      (cons (car x)
            (my-cons (cdr x) y))))





