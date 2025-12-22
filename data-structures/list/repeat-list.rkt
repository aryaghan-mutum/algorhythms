;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require rackunit racket/trace)
(provide repeat-list)

(define (repeat-list n limit)
  (define (repeat-aux n limit rlst)
    (cond ((zero? limit) rlst)
          (else (repeat-aux n
                            (sub1 limit)
                            (cons n rlst)))))
  (repeat-aux n (inexact->exact (round limit)) '()))

(check-equal? (repeat-list 'a 0) '())
(check-equal? (repeat-list 'a 3) '(a a a))
(check-equal? (repeat-list 0 3) '(0 0 0))
(check-equal? (repeat-list 10 3) '(10 10 10))
(check-equal? (repeat-list 3 10) '(3 3 3 3 3 3 3 3 3 3))
(check-equal? (repeat-list 3 10.5) '(3 3 3 3 3 3 3 3 3 3))
