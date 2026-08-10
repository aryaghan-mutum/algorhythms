#lang racket

;; Author: Anurag Muthyam

(provide mod-exp
         mod-inverse)

;; Modular exponentiation: (base^exp) mod m
(define (mod-exp base exp m)
  (cond [(zero? exp) 1]
        [(even? exp)
         (remainder (sqr (mod-exp base (/ exp 2) m)) m)]
        [else
         (remainder (* base (mod-exp base (- exp 1) m)) m)]))

;; Modular multiplicative inverse using extended Euclidean algorithm
(define (mod-inverse a m)
  (let-values ([(g x _) (extended-gcd a m)])
    (if (= g 1)
        (modulo x m)
        (error "Inverse does not exist"))))

(define (extended-gcd a b)
  (if (zero? b)
      (values a 1 0)
      (let-values ([(g x y) (extended-gcd b (remainder a b))])
        (values g y (- x (* (quotient a b) y))))))
