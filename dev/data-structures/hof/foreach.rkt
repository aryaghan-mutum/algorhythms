#lang racket

;; Author: Anurag Muthyam
(provide for-each)


(define (for-each fn lst)
  (define (for-each-iter  lst acc)
    (if (empty? lst)
        acc
        (for-each-iter (cdr lst)
              (fn (car lst)))))
  (for-each-iter lst '()))


(define (for-each! fn lst)
  (define (for-each-iter  lst acc)
    (if (empty? lst)
        acc
        (for-each-iter (cdr lst)
              (fn (car lst)))))
  (for-each-iter lst '()))
