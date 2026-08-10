#lang racket

(define (list-size lst)
  (if (empty? lst)
      0
      (add1 (list-size (cdr lst)))))

(define (list-size2 lst)
  (if (empty? lst)
      0
      (+ (if (or (pair? (car lst)) (empty? (car lst)))
          0
          1)
         (list-size2 (cdr lst)))))


