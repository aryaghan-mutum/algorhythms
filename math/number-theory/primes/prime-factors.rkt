;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require math racket/trace rackunit threading)
(provide prime-factors-v1 prime-factors-v2)

;; Reference: https://rosettacode.org/wiki/Prime_decomposition

;; using append-map and factorize version 1
(define (prime-factors-v1 n)
  (append-map (lambda (x) (make-list (second x) (car x))) (factorize n)))

;; using both recursive and iterative process version 2
(define (prime-factors-v2 n)
  (define (prime-factors-aux n i)
    (let-values (((q r) (quotient/remainder n i)))
      (cond ((= n 1) '())
            ((zero? r) (cons i (prime-factors-aux q i)))
            (else (prime-factors-aux n (add1 i))))))
  (prime-factors-aux n 2))

(check-equal? (prime-factors-v1 0) '())
(check-equal? (prime-factors-v1 1) '())
(check-equal? (prime-factors-v1 2) '(2))
(check-equal? (prime-factors-v1 6) '(2 3))
(check-equal? (prime-factors-v1 12) '(2 2 3))
(check-equal? (prime-factors-v1 10) '(2 5))
(check-equal? (prime-factors-v1 144) '(2 2 2 2 3 3))
(check-equal? (prime-factors-v1 600851475143) '(71 839 1471 6857))

;(check-equal? (prime-factors-v2 0) '())
(check-equal? (prime-factors-v2 1) '())
(check-equal? (prime-factors-v2 2) '(2))
(check-equal? (prime-factors-v2 6) '(2 3))
(check-equal? (prime-factors-v2 12) '(2 2 3))
(check-equal? (prime-factors-v2 10) '(2 5))
(check-equal? (prime-factors-v2 144) '(2 2 2 2 3 3))
(check-equal? (prime-factors-v2 600851475143) '(71 839 1471 6857))
