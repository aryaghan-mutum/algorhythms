#lang racket

(define (select l i)
  (if (= i 0)
      (car l)
      (select (cdr l) (sub1 1))))