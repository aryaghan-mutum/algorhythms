#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require rackunit
         rackunit/text-ui
         "../../src/math/number-theory/primes/primes.rkt"
         "../../src/math/number-theory/primes/prime-factors.rkt"
         "../../src/math/number-theory/primes/sieve-of-eratosthenes.rkt"
         "../../src/math/number-theory/primes/euler-prime-polynomial.rkt"
         "../../src/math/number-theory/gcd.rkt"
         "../../src/math/number-theory/lcm.rkt"
         "../../src/math/number-theory/fibonacci.rkt"
         "../../src/math/number-theory/modular-arithmetic.rkt"
         "../../src/math/number-theory/numerical-predicates.rkt"
         "../../src/math/number-theory/three-number-comparisons.rkt"
         "../../src/math/number-theory/digit-conversion.rkt"
         "../../src/math/number-theory/palindrome-num.rkt"
         "../../src/math/number-theory/reverse-number.rkt"
         "../../src/math/number-theory/pythagorean-triplets.rkt"
         "../../src/math/number-theory/even-odd-lists.rkt"
         "../../src/math/number-theory/collatz.rkt"
         "../../src/math/number-theory/leap-year.rkt"
         "../../src/math/number-theory/divisibility/divisors.rkt"
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
    (test-case "primes-up-to-via-sieve up to 20 matches primes-up-to"
      (check-equal? (primes-up-to-via-sieve 20) (primes-up-to 20))))

   (test-suite
    "primes - edge"
    (test-case "1 is not prime" (check-false (prime? 1)))
    (test-case "0 is not prime" (check-false (prime? 0)))
    (test-case "primes-up-to below 2 is empty" (check-equal? (primes-up-to 1) '()))
    (test-case "primes-up-to-via-sieve below 2 is empty" (check-equal? (primes-up-to-via-sieve 1) '()))
    (test-case "prime-factors of 1 is empty" (check-equal? (prime-factors 1) '()))
    (test-case "prime-factors of 0 is empty" (check-equal? (prime-factors 0) '())))

   (test-suite
    "primes - invalid"
    (test-case "negative n is not prime" (check-false (prime? -7)))
    (test-case "prime-factors of a negative number is empty (below its <= 1 base case)"
      (check-equal? (prime-factors -12) '()))
    (test-case "prime? errors on a non-integer decimal input"
      (check-exn exn:fail:contract? (lambda () (prime? 4.5))))
    (test-case "prime-factors errors on a non-integer decimal input"
      (check-exn exn:fail:contract? (lambda () (prime-factors 4.5)))))

   (test-suite
    "euler-prime-polynomial - valid"
    (test-case "n^2-n+41 produces a prime for every n in 0..39"
      (check-true (andmap prime? (map euler-candidate-minus (range 0 40)))))
    (test-case "n^2+n+41 produces a prime for every n in 0..39"
      (check-true (andmap prime? (map euler-candidate-plus (range 0 40)))))
    (test-case "n^2-n+41 at n=40 is still prime (1601)"
      (check-true (prime? (euler-candidate-minus 40)))))

   (test-suite
    "euler-prime-polynomial - edge"
    (test-case "n^2-n+41 first fails at n=41 (1681 = 41^2, composite)"
      (check-false (prime? (euler-candidate-minus 41))))
    (test-case "n^2+n+41 first fails at n=41 (composite)"
      (check-false (prime? (euler-candidate-plus 41))))
    (test-case "n^2+n+41 at n=0 is 41" (check-equal? (euler-candidate-plus 0) 41)))

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
    "gcd/lcm - invalid"
    (test-case "gcd-euclidean(-12, 8) still returns the positive gcd (4)"
      (check-equal? (gcd-euclidean -12 8) 4))
    (test-case "lcm-custom(-4, 6) follows the sign of a*b/gcd (-12)"
      (check-equal? (lcm-custom -4 6) -12))
    (test-case "gcd-euclidean errors on a non-integer decimal input"
      (check-exn exn:fail:contract? (lambda () (gcd-euclidean 12.5 8)))))

   (test-suite
    "fibonacci - valid"
    (test-case "fibonacci-optimized(10) is 55" (check-equal? (fibonacci-optimized 10) 55))
    (test-case "fibonacci-optimized(20) is 6765" (check-equal? (fibonacci-optimized 20) 6765))
    (test-case "sum-fibonacci(5) sums F(0..4)" (check-equal? (sum-fibonacci 5) 7))
    (test-case "sum-even-fibonacci(10) sums the even terms of F(0..10)"
      (check-equal? (sum-even-fibonacci 10) (foldr + 0 (filter even? (fibonacci-list (range 0 11)))))))

   (test-suite
    "fibonacci - edge"
    (test-case "fibonacci-optimized(0) is 0" (check-equal? (fibonacci-optimized 0) 0))
    (test-case "fibonacci-optimized(1) is 1" (check-equal? (fibonacci-optimized 1) 1)))

   (test-suite
    "fibonacci - invalid"
    (test-case "fibonacci-optimized errors instead of looping forever on negative input"
      (check-exn exn:fail? (lambda () (fibonacci-optimized -1))))
    (test-case "fibonacci-optimized errors on a non-integer decimal input"
      (check-exn exn:fail:contract? (lambda () (fibonacci-optimized 4.5)))))

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
      (check-exn exn:fail? (lambda () (mod-inverse 2 4))))
    (test-case "mod-exp errors on a non-integer decimal modulus"
      (check-exn exn:fail:contract? (lambda () (mod-exp 4 13 4.5)))))

   (test-suite
    "numerical-predicates - valid"
    (test-case "zero-num? of 0 is true" (check-true (zero-num? 0)))
    (test-case "one? of 1 is true" (check-true (one? 1)))
    (test-case "non-negative-num? of 3 is true" (check-true (non-negative-num? 3)))
    (test-case "negative-num? of -3 is true" (check-true (negative-num? -3)))
    (test-case "even-num? of 4 is true" (check-true (even-num? 4)))
    (test-case "odd-num? of 3 is true" (check-true (odd-num? 3)))
    (test-case "square? of 9 is true" (check-true (square? 9))))

   (test-suite
    "numerical-predicates - edge"
    (test-case "even-num? of negative even number" (check-true (even-num? -4)))
    (test-case "odd-num? of negative odd number" (check-true (odd-num? -3)))
    (test-case "non-negative-num? of 0 is true" (check-true (non-negative-num? 0)))
    (test-case "negative-num? of 0 is false" (check-false (negative-num? 0)))
    (test-case "square? of 0 is true" (check-true (square? 0))))

   (test-suite
    "numerical-predicates - invalid"
    (test-case "square? of a non-perfect-square is false" (check-false (square? 8)))
    (test-case "square? of a negative number is false, not an error" (check-false (square? -9)))
    (test-case "square? of a non-integer decimal is false" (check-false (square? 4.5)))
    (test-case "even-num? errors on a non-integer decimal input"
      (check-exn exn:fail:contract? (lambda () (even-num? 4.5)))))

   (test-suite
    "three-number-comparisons - valid"
    (test-case "sum-lesser? true when x+y < z" (check-true (sum-lesser? 1 2 10)))
    (test-case "sum-greater? true when x+y > z" (check-true (sum-greater? 5 6 2)))
    (test-case "sum-equal? true when x+y = z" (check-true (sum-equal? 2 3 5))))

   (test-suite
    "three-number-comparisons - edge/invalid"
    (test-case "sum-lesser? with negative numbers" (check-true (sum-lesser? -5 -5 0)))
    (test-case "sum-equal? with decimal numbers" (check-true (sum-equal? 1.5 2.5 4.0)))
    (test-case "sum-greater? is false at exact equality" (check-false (sum-greater? 2 3 5))))

   (test-suite
    "digit-conversion - valid"
    (test-case "integer->digit-list of 123 is (1 2 3)" (check-equal? (integer->digit-list 123) '(1 2 3)))
    (test-case "digit-list->integer of (1 2 3) is 123" (check-equal? (digit-list->integer '(1 2 3)) 123)))

   (test-suite
    "digit-conversion - edge"
    (test-case "integer->digit-list of 0 is (0)" (check-equal? (integer->digit-list 0) '(0)))
    (test-case "round-trip through both conversions is the identity"
      (check-equal? (digit-list->integer (integer->digit-list 90210)) 90210)))

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
    (test-case "negative numbers are not palindromes" (check-false (palindrome-num? -121)))
    (test-case "palindrome-num? errors on a non-integer decimal input"
      (check-exn exn:fail:contract? (lambda () (palindrome-num? 4.5)))))

   (test-suite
    "pythagorean-triplets/triple? - valid"
    (test-case "triplets up to 15 include (3 4 5)"
      (check-not-false (member '(3 4 5) (pythagorean-triplets 15))))
    (test-case "(3 4 5) is a Pythagorean triple" (check-true (pythagorean-triple? 3 4 5)))
    (test-case "(5 12 13) is a Pythagorean triple" (check-true (pythagorean-triple? 5 12 13))))

   (test-suite
    "pythagorean-triplets/triple? - edge"
    (test-case "no triplets exist below limit 5"
      (check-equal? (pythagorean-triplets 4) '()))
    (test-case "(3 4 6) is not a Pythagorean triple" (check-false (pythagorean-triple? 3 4 6))))

   (test-suite
    "even-odd-lists - valid"
    (test-case "even-num? of 4" (check-true (even-num? 4)))
    (test-case "odd-num? of 3" (check-true (odd-num? 3)))
    (test-case "even-numbers-in-range in 1..10"
      (check-equal? (even-numbers-in-range 1 10) '(2 4 6 8 10)))
    (test-case "even-list filters, preserving original order"
      (check-equal? (even-list '(5 2 8 3 4)) '(2 8 4)))
    (test-case "odd-list filters, preserving original order"
      (check-equal? (odd-list '(5 2 8 3 4)) '(5 3))))

   (test-suite
    "even-odd-lists - edge"
    (test-case "even-num? of 0" (check-true (even-num? 0)))
    (test-case "even-numbers-in-range with no evens in range"
      (check-equal? (even-numbers-in-range 1 1) '()))
    (test-case "even-numbers-in-range over a negative range"
      (check-equal? (even-numbers-in-range -5 5) '(-4 -2 0 2 4)))
    (test-case "even-list on a list with negatives and an integer-valued decimal"
      (check-equal? (even-list '(-4 3 2.0 -7 8)) '(-4 2.0 8))))

   (test-suite
    "even-odd-lists - invalid"
    (test-case "even-list errors on a genuinely non-integer decimal element"
      (check-exn exn:fail:contract? (lambda () (even-list '(2 3.5 4))))))

   (test-suite
    "divisibility - valid"
    (test-case "proper-divisors of 12 excludes 12 itself"
      (check-equal? (proper-divisors 12) '(1 2 3 4 6)))
    (test-case "divisors of 12 includes 12 itself"
      (check-equal? (divisors 12) '(1 2 3 4 6 12)))
    (test-case "divisors-list maps divisors over each element"
      (check-equal? (divisors-list '(4 6)) (list (divisors 4) (divisors 6))))
    (test-case "safe-div computes normally for non-zero divisor"
      (check-equal? ((safe-div 10 2) (lambda (r) r) (lambda (e) e)) 5)))

   (test-suite
    "divisibility - edge"
    (test-case "proper-divisors of 1 is empty" (check-equal? (proper-divisors 1) '()))
    (test-case "divisors of 1 is (1)" (check-equal? (divisors 1) '(1))))

   (test-suite
    "divisibility - invalid"
    (test-case "proper-divisors of a negative number is empty, not an infinite loop"
      (check-equal? (proper-divisors -12) '()))
    (test-case "proper-divisors of 0 is empty, not an infinite loop"
      (check-equal? (proper-divisors 0) '()))
    (test-case "divisors of a negative number is empty"
      (check-equal? (divisors -12) '()))
    (test-case "divisors errors on a non-integer decimal input"
      (check-exn exn:fail:contract? (lambda () (divisors 4.5))))
    (test-case "safe-div raises an error dividing by zero"
      (check-exn exn:fail? (lambda () ((safe-div 10 0) (lambda (r) r) (lambda (e) e))))))

   (test-suite
    "reverse-number/aliases - valid"
    (test-case "reverse-number reverses the digits" (check-equal? (reverse-number 123) 321))
    (test-case "is-prime? is an alias of prime?" (check-equal? (is-prime? 17) (prime? 17)))
    (test-case "gcd matches gcd-euclidean" (check-equal? (gcd 12 18) (gcd-euclidean 12 18)))
    (test-case "lcm matches lcm-custom" (check-equal? (lcm 4 6) (lcm-custom 4 6)))
    (test-case "fibonacci is an alias of fibonacci-optimized" (check-equal? (fibonacci 10) (fibonacci-optimized 10)))
    (test-case "palindrome-number? is an alias of palindrome-num?" (check-true (palindrome-number? 121)))
    (test-case "built-in even?/odd? are re-exported" (check-true (even? 4)) (check-true (odd? 3))))

   (test-suite
    "reverse-number - edge/invalid"
    (test-case "reverse-number of 0 is 0" (check-equal? (reverse-number 0) 0))
    (test-case "reverse-number of a negative number reverses the magnitude"
      (check-equal? (reverse-number -123) 321))
    (test-case "reverse-number errors on a non-integer decimal input"
      (check-exn exn:fail:contract? (lambda () (reverse-number 4.5)))))

   (test-suite
    "collatz-steps - valid"
    (test-case "n=1 base case is 1 step" (check-equal? (collatz-steps 1) 1))
    (test-case "n=2 takes 2 steps" (check-equal? (collatz-steps 2) 2))
    (test-case "n=6 takes 9 steps" (check-equal? (collatz-steps 6) 9))
    (test-case "n=27 (long chain) takes 112 steps" (check-equal? (collatz-steps 27) 112)))

   (test-suite
    "collatz-steps - invalid"
    (test-case "zero raises"
      (check-exn exn:fail? (lambda () (collatz-steps 0))))
    (test-case "negative raises"
      (check-exn exn:fail? (lambda () (collatz-steps -5)))))

   (test-suite
    "leap-year? - valid"
    (test-case "2000 is a leap year (div by 400)" (check-true (leap-year? 2000)))
    (test-case "2020 is a leap year (div by 4, not 100)" (check-true (leap-year? 2020)))
    (test-case "2100 is NOT a leap year (div by 100, not 400)" (check-false (leap-year? 2100)))
    (test-case "2019 is not a leap year" (check-false (leap-year? 2019))))

   (test-suite
    "leap-year? - edge"
    (test-case "year 0 is a leap year (divisible by 400)" (check-true (leap-year? 0)))
    (test-case "negative year 4 is treated as leap" (check-true (leap-year? -4))))))

(run-tests number-theory-tests)

