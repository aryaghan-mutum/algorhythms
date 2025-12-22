;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket

(require rackunit threading)
(provide even-nums-lst-v1 even-nums-lst-v2)

;; get a list of even numbers
;; input: 1 to 10
;; output: '(2 4 6 8 10)

;; get a list of even numbers using iterative process
(define (even-nums-lst-v1 start end)
  (define lst (range start (add1 end)))
  (define (prob-aux lst rlst)
    (cond ((empty? lst) rlst)
          ((zero? (remainder (car lst) 2))
           (prob-aux (cdr lst) (cons (car lst) rlst)))
          (else (prob-aux (cdr lst) rlst))))
  (reverse (prob-aux lst '())))

;; get a list of even numbers using filter and threading
(define (even-nums-lst-v2 start end)
  (define lst (range start (add1 end)))
  (~> lst (filter even? _)))

(check-equal? (even-nums-lst-v1 1 10) '(2 4 6 8 10))

(check-equal? (even-nums-lst-v2 1 10) '(2 4 6 8 10))
