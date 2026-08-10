#lang racket

;; Author: Anurag Muthyam
;; Number theory: primality, gcd/lcm, factorial, fibonacci, prime factors,
;; even/odd predicates, palindrome check, and digit reversal.

(require (only-in "number-theory/primes/primes.rkt" prime?)
         (only-in "combinatorics/factorial.rkt" factorial)
         (only-in "number-theory/fibonacci.rkt" fibonacci-optimized)
         (only-in "number-theory/primes/prime-factors.rkt" prime-factors)
         (only-in "number-theory/palindrome-num.rkt" palindrome-num? int->list-helper list->int-helper)
         (only-in "arithmetic/abs.rkt" absolute))

(provide is-prime?
         gcd
         lcm
         factorial
         fibonacci
         prime-factors
         even?
         odd?
         palindrome-number?
         reverse-number)

;; is-prime? : integer? -> boolean?
(define is-prime? prime?)

;; fibonacci : integer? -> integer? (nth Fibonacci number, 0-indexed)
(define fibonacci fibonacci-optimized)

;; palindrome-number? : integer? -> boolean?
(define palindrome-number? palindrome-num?)

;; reverse-number : integer? -> integer? (reverses the decimal digits of n)
(define (reverse-number n)
  (list->int-helper (reverse (int->list-helper (absolute n)))))
