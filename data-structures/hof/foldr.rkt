#lang racket

(provide my-foldr
         foldr-iter)

;; Author: Anurag Muthyam
;; foldr implementation:

(define (my-foldr fn start lst)
  (if (empty? lst)
      start
      (fn (car lst) (my-foldr fn start (cdr lst)))))

;; foldRight using let (iterative style)
(define (foldr-iter fn init lst)
  (let loop ((lst lst))
    (if (empty? lst)
        init
        (fn (car lst)
            (loop (cdr lst))))))

