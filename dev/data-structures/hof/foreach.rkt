#lang racket


(define (for-each! fn lst)
  (define (for-each-iter  lst acc)
    (if (empty? lst)
        acc
        (for-each-iter (cdr lst)
              (fn (car lst)))))
  (for-each-iter lst '()))


