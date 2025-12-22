;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require rackunit threading)
(provide divisible-by-5-v1 divisible-by-5-v2 divisible-by-5-v3)

;; return a list of elements that are divisible by 5

;; using iterative process version 1
(define (divisible-by-5-v1 blst)
  (define (prob-aux blst rlst)
    (cond ((empty? blst) rlst)
          ((zero? (remainder (car blst) 5))
           (prob-aux (cdr blst)
                     (cons (car blst) rlst)))
          (else (prob-aux (cdr blst) rlst))))
  (reverse (prob-aux blst '())))

;; using filter function version 2
(define (divisible-by-5-v2 blst)
  (define pred (lambda (n) (zero? (remainder n 5))))
  (filter pred blst))

;; using filter function and threading version 3
(define (divisible-by-5-v3 blst)
  (~> blst
      (filter (lambda (n) (zero? (remainder n 5))) _)))

(check-equal? (divisible-by-5-v1 '()) '())
(check-equal? (divisible-by-5-v1 '(0011)) '())
(check-equal? (divisible-by-5-v1 '(0100)) '(0100))
(check-equal? (divisible-by-5-v1 '(0100 0011 1010 1001)) '(0100 1010))

(check-equal? (divisible-by-5-v2 '()) '())
(check-equal? (divisible-by-5-v2 '(0011)) '())
(check-equal? (divisible-by-5-v2 '(0100)) '(0100))
(check-equal? (divisible-by-5-v2 '(0100 0011 1010 1001)) '(0100 1010))

(check-equal? (divisible-by-5-v3 '()) '())
(check-equal? (divisible-by-5-v3 '(0011)) '())
(check-equal? (divisible-by-5-v3 '(0100)) '(0100))
(check-equal? (divisible-by-5-v3 '(0100 0011 1010 1001)) '(0100 1010))
