#lang racket

;; Number Theory Examples
;; Demonstrates prime numbers, GCD, LCM, and related functions

(require algorhythms)

(displayln "=== Number Theory Examples ===\n")

;; Prime Numbers
(displayln "--- Prime Number Checking ---")
(for ([n '(2 3 4 5 6 7 8 9 10 11 13 17 19 23 29)])
  (printf "~a is prime? ~a\n" n (prime? n)))
(displayln "")

;; GCD (Greatest Common Divisor)
(displayln "--- Greatest Common Divisor ---")
(printf "gcd(48, 18) = ~a\n" (gcd 48 18))
(printf "gcd(100, 35) = ~a\n" (gcd 100 35))
(printf "gcd(270, 192) = ~a\n" (gcd 270 192))
(displayln "")

;; LCM (Least Common Multiple)
(displayln "--- Least Common Multiple ---")
(printf "lcm(4, 6) = ~a\n" (lcm 4 6))
(printf "lcm(21, 6) = ~a\n" (lcm 21 6))
(printf "lcm(8, 9) = ~a\n" (lcm 8 9))
(displayln "")

;; Factorial
(displayln "--- Factorial ---")
(for ([n (range 0 11)])
  (printf "~a! = ~a\n" n (factorial n)))
(displayln "")

;; Relationship: gcd(a,b) * lcm(a,b) = a * b
(displayln "--- Property: gcd(a,b) × lcm(a,b) = a × b ---")
(define a 12)
(define b 18)
(printf "a = ~a, b = ~a\n" a b)
(printf "gcd(~a, ~a) = ~a\n" a b (gcd a b))
(printf "lcm(~a, ~a) = ~a\n" a b (lcm a b))
(printf "gcd × lcm = ~a\n" (* (gcd a b) (lcm a b)))
(printf "a × b = ~a\n" (* a b))
(printf "Equal? ~a\n" (= (* (gcd a b) (lcm a b)) (* a b)))
