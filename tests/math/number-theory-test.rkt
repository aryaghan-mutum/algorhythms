#lang racket

(require rackunit
         "../../math/number-theory/primes.rkt"
         "../../math/number-theory/gcd.rkt"
         "../../math/number-theory/lcm.rkt"
         "../../math/number-theory/prime-factorization.rkt")

;; Prime tests
(check-true (prime? 2) "2 is prime")
(check-true (prime? 17) "17 is prime")
(check-true (prime? 97) "97 is prime")
(check-false (prime? 1) "1 is not prime")
(check-false (prime? 4) "4 is not prime")
(check-false (prime? 100) "100 is not prime")

;; Primes up to tests
(check-equal? (primes-up-to 10) '(2 3 5 7) "primes up to 10")
(check-equal? (primes-up-to 20) '(2 3 5 7 11 13 17 19) "primes up to 20")

;; GCD tests
(check-equal? (gcd-custom 12 8) 4 "gcd(12, 8)")
(check-equal? (gcd-custom 17 13) 1 "gcd of coprimes")
(check-equal? (gcd-custom 100 25) 25 "gcd(100, 25)")

;; LCM tests
(check-equal? (lcm-custom 4 6) 12 "lcm(4, 6)")
(check-equal? (lcm-custom 3 5) 15 "lcm of coprimes")

;; Prime factorization tests
(check-equal? (prime-factors 12) '(2 2 3) "factors of 12")
(check-equal? (prime-factors 30) '(2 3 5) "factors of 30")

(displayln "Number theory tests passed!")
