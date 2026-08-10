#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require rackunit
         rackunit/text-ui
         "../../src/math/number-theory/primes/primes.rkt"
         "../../src/math/number-theory/primes/prime-factors.rkt"
         "../../src/math/number-theory/primes/primes-list.rkt"
         "../../src/math/number-theory/gcd.rkt"
         "../../src/math/number-theory/lcm.rkt"
         "../../src/math/number-theory/fibonacci.rkt"
         "../../src/math/number-theory/modular-arithmetic.rkt"
         "../../src/math/number-theory/numerical-predicates.rkt"
         "../../src/math/number-theory/palindrome-num.rkt"
         "../../src/math/number-theory/reverse-number.rkt"
         "../../src/math/number-theory/pythagorean-triplets.rkt"
         "../../src/math/number-theory/even-odd/even-nums-list.rkt"
         "../../src/math/number-theory/even-odd/numbers-list.rkt"
         "../../src/math/number-theory/divisibility/factors.rkt"
         "../../src/math/number-theory/divisibility/safe-div.rkt")

(define number-theory-tests
  (test-suite
   "number-theory"

   (test-suite
    "primes - valid"
    (test-case "2 is prime" (check-true (prime? 2)))
    (test-case "17 is prime" (check-true (prime? 17)))
    (test-case "97 is prime" (check-true (prime? 97)))
    (test-case "4 is not prime" (check-false (prime? 4)))
    (test-case "primes-up-to 20" (check-equal? (primes-up-to 20) '(2 3 5 7 11 13 17 19)))
    (test-case "next-prime after 14 is 17" (check-equal? (next-prime 14) 17))
    (test-case "prime-factors of 12" (check-equal? (prime-factors 12) '(2 2 3)))
    (test-case "prime-factorization of 12" (check-equal? (prime-factorization 12) '((2 . 2) (3 . 1))))
    (test-case "primes-list-sieve up to 20" (check-equal? (primes-list-sieve 20) '(2 3 5 7 11 13 17 19))))

   (test-suite
    "primes - edge"
    (test-case "1 is not prime" (check-false (prime? 1)))
    (test-case "0 is not prime" (check-false (prime? 0)))
    (test-case "primes-up-to below 2 is empty" (check-equal? (primes-up-to 1) '()))
    (test-case "primes-list-sieve below 2 is empty" (check-equal? (primes-list-sieve 1) '())))

   (test-suite
    "primes - invalid"
    (test-case "negative n is not prime" (check-false (prime? -7))))

   (test-suite
    "gcd/lcm - valid"
    (test-case "gcd-euclidean(12, 8) is 4" (check-equal? (gcd-euclidean 12 8) 4))
    (test-case "gcd-euclidean of coprimes is 1" (check-equal? (gcd-euclidean 17 13) 1))
    (test-case "lcm-custom(4, 6) is 12" (check-equal? (lcm-custom 4 6) 12))
    (test-case "lcm-custom of coprimes is their product" (check-equal? (lcm-custom 3 5) 15)))

   (test-suite
    "gcd/lcm - edge"
    (test-case "gcd-euclidean(a, 0) is a" (check-equal? (gcd-euclidean 100 0) 100))
    (test-case "lcm-custom(a, 0) is 0" (check-equal? (lcm-custom 5 0) 0)))

   (test-suite
    "fibonacci - valid"
    (test-case "fibonacci-optimized(10) is 55" (check-equal? (fibonacci-optimized 10) 55))
    (test-case "fibonacci-optimized(20) is 6765" (check-equal? (fibonacci-optimized 20) 6765))
    (test-case "sum-fibonacci-v2(5) sums F(0..4)" (check-equal? (sum-fibonacci-v2 5) 7)))

   (test-suite
    "fibonacci - edge"
    (test-case "fibonacci-optimized(0) is 0" (check-equal? (fibonacci-optimized 0) 0))
    (test-case "fibonacci-optimized(1) is 1" (check-equal? (fibonacci-optimized 1) 1)))

   (test-suite
    "modular-arithmetic - valid"
    (test-case "mod-exp(4, 13, 497) is 445" (check-equal? (mod-exp 4 13 497) 445))
    (test-case "mod-inverse(3, 11) is 4 (3*4 mod 11 = 1)" (check-equal? (mod-inverse 3 11) 4)))

   (test-suite
    "modular-arithmetic - edge"
    (test-case "mod-exp with exponent 0 is 1" (check-equal? (mod-exp 7 0 5) 1)))

   (test-suite
    "modular-arithmetic - invalid"
    (test-case "mod-inverse errors when gcd(a, m) != 1"
      (check-exn exn:fail? (lambda () (mod-inverse 2 4)))))

   (test-suite
    "numerical-predicates - valid"
    (test-case "zero-num? of 0 is true" (check-true (zero-num? 0)))
    (test-case "one? of 1 is true" (check-true (one? 1)))
    (test-case "even-num? of 4 is true" (check-true (even-num? 4)))
    (test-case "odd-num? of 3 is true" (check-true (odd-num? 3)))
    (test-case "square? of 9 is true" (check-true (square? 9)))
    (test-case "prime-custom? of 13 is true" (check-true (prime-custom? 13))))

   (test-suite
    "numerical-predicates - edge"
    (test-case "even-num? of negative even number" (check-true (even-num? -4)))
    (test-case "odd-num? of negative odd number" (check-true (odd-num? -3)))
    (test-case "square? of 0 is true" (check-true (square? 0))))

   (test-suite
    "numerical-predicates - invalid"
    (test-case "square? of a non-perfect-square is false" (check-false (square? 8)))
    (test-case "prime-custom? of 1 is false" (check-false (prime-custom? 1))))

   (test-suite
    "palindrome-num? - valid"
    (test-case "121 is a palindrome" (check-true (palindrome-num? 121)))
    (test-case "12321 is a palindrome" (check-true (palindrome-num? 12321)))
    (test-case "123 is not a palindrome" (check-false (palindrome-num? 123))))

   (test-suite
    "palindrome-num? - edge"
    (test-case "single-digit numbers are palindromes" (check-true (palindrome-num? 7)))
    (test-case "0 is a palindrome" (check-true (palindrome-num? 0))))

   (test-suite
    "palindrome-num? - invalid"
    (test-case "negative numbers are not palindromes" (check-false (palindrome-num? -121))))

   (test-suite
    "pythagorean-triplets - valid"
    (test-case "triplets up to 15 include (3 4 5)"
      (check-not-false (member '(3 4 5) (pythagorean-triplets 15)))))

   (test-suite
    "pythagorean-triplets - edge"
    (test-case "no triplets exist below limit 5"
      (check-equal? (pythagorean-triplets 4) '())))

   (test-suite
    "even-odd - valid"
    (test-case "even-num? of 4" (check-true (even-num? 4)))
    (test-case "odd-num? of 3" (check-true (odd-num? 3)))
    (test-case "even-numbers-in-range in 1..10"
      (check-equal? (even-numbers-in-range 1 10) '(2 4 6 8 10)))
    (test-case "even-list filters, preserving original order"
      (check-equal? (even-list '(5 2 8 3 4)) '(2 8 4)))
    (test-case "odd-list filters, preserving original order"
      (check-equal? (odd-list '(5 2 8 3 4)) '(5 3))))

   (test-suite
    "even-odd - edge"
    (test-case "even-num? of 0" (check-true (even-num? 0)))
    (test-case "even-numbers-in-range with no evens in range"
      (check-equal? (even-numbers-in-range 1 1) '())))

   (test-suite
    "divisibility - valid"
    (test-case "factors of 12 is its prime factorization with repetition"
      (check-equal? (factors 12) '(2 2 3)))
    (test-case "safe-div computes normally for non-zero divisor"
      (check-equal? ((safe-div 10 2) (lambda (r) r) (lambda (e) e)) 5)))

   (test-suite
    "divisibility - invalid"
    (test-case "safe-div raises an error dividing by zero"
      (check-exn exn:fail? (lambda () ((safe-div 10 0) (lambda (r) r) (lambda (e) e))))))

   (test-suite
    "reverse-number/log.txt-spec aliases - valid"
    (test-case "reverse-number reverses the digits" (check-equal? (reverse-number 123) 321))
    (test-case "is-prime? is an alias of prime?" (check-equal? (is-prime? 17) (prime? 17)))
    (test-case "gcd matches gcd-euclidean" (check-equal? (gcd 12 18) (gcd-euclidean 12 18)))
    (test-case "lcm matches lcm-custom" (check-equal? (lcm 4 6) (lcm-custom 4 6)))
    (test-case "fibonacci is an alias of fibonacci-optimized" (check-equal? (fibonacci 10) (fibonacci-optimized 10)))
    (test-case "palindrome-number? is an alias of palindrome-num?" (check-true (palindrome-number? 121)))
    (test-case "built-in even?/odd? are re-exported" (check-true (even? 4)) (check-true (odd? 3))))))

(run-tests number-theory-tests)

