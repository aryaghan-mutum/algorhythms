;; Author: Anurag Muthyam

#lang racket

(require threading)
(provide even-nums-lst-v1 even-nums-lst-v2)

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