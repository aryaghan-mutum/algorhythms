;; Author: Anurag Muthyam

#lang racket

(require racket/trace rackunit threading)
(provide squares-list-v1 squares-list-v2 squares-list-v3 squares-list-v4)

;; generates a list of squares
;; only works for n >= 0. Doesn't work when n < 0

;; using map version 1
(define (squares-list-v1 n)
  (~> (build-list n values)
      (map sqr _)))

;; using iterative process and without using map version 2
(define (squares-list-v2 n)
  (define (squares-list-iter lst rlst)
    (cond ((empty? lst) rlst)
          (else
           (squares-list-iter (cdr lst)
                              (cons (sqr (car lst)) rlst)))))
  (reverse (squares-list-iter (build-list n values) '())))

;; using recurisve process version 3
(define (squares-list-v3 n)
    (define (squares-list-recur i)
      (cond ((= i n) '())
            (else (cons (sqr i)
                        (squares-list-recur (add1 i))))))
    (squares-list-recur 0))

;; using iterative process and range. Allows negative numbers also version 3
(define (squares-list-v4 start end)
  (define (squares-list-iter lst rlst)
    (cond ((empty? lst) rlst)
          (else
           (squares-list-iter (cdr lst)
                              (cons (sqr (car lst)) rlst)))))
  (reverse (squares-list-iter (range start end) '())))
