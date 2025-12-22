;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require rackunit)
(provide duplicates-by-fn)

;; get duplciates based on a function
(define (duplicates-by-fn fn lst)
  (define (duplicates-aux fn lst rlst)
    (cond ((empty? lst) rlst)
          ((fn (car lst))
           (duplicates-aux fn (cdr lst) (cons (car lst) rlst)))
          (else (duplicates-aux fn (cdr lst) rlst))))
  (duplicates-aux fn lst '()))

(check-equal? (duplicates-by-fn zero? '(0 1 0 3 12)) '(0 0))
(check-equal? (duplicates-by-fn (lambda (x) (= x 1)) '(0 1 0 3 1 12)) '(1 1))
(check-equal? (duplicates-by-fn (lambda (x) (= x 100)) '(0 1 0 3 1 12)) '())
(check-equal? (duplicates-by-fn (lambda (x) (= x 1.25)) '(0 1.25 0 3 1.25 12)) '(1.25 1.25))
