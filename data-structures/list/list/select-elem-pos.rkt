#lang racket

(require racket/trace)

(define (select l i)
  (if (= i 0)
      (car l)
      (select (cdr l) (sub1 1))))

(trace select)
(select '(a b c d e f) 1)
(select (list 1 2 3 4 5) 1)
(select (list 1 2 3 4 5) 4)
