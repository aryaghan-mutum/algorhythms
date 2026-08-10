#lang racket

;; Author: Anurag Muthyam
;; Prime number functions

(provide prime?
         primes-up-to
         next-prime)

;; Check if n is prime
(define (prime? n)
  (cond [(<= n 1) #f]
        [(= n 2) #t]
        [(even? n) #f]
        [else (prime-helper n 3)]))

(define (prime-helper n divisor)
  (cond [(> (* divisor divisor) n) #t]
        [(zero? (remainder n divisor)) #f]
        [else (prime-helper n (+ divisor 2))]))

;; Generate all primes up to n
(define (primes-up-to n)
  (filter prime? (range 2 (+ n 1))))

;; Find the next prime after n
(define (next-prime n)
  (let ([candidate (if (even? n) (+ n 1) (+ n 2))])
    (if (prime? candidate)
        candidate
        (next-prime candidate))))
