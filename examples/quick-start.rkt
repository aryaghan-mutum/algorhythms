#lang racket

;; Algorhythms Quick Start Examples
;; Run with: racket quick-start.rkt

(require algorhythms)

(displayln "=== Algorhythms Quick Start ===\n")

;; Factorial
(displayln "--- Factorial ---")
(printf "factorial(5) = ~a\n" (factorial 5))
(printf "factorial(10) = ~a\n" (factorial 10))
(displayln "")

;; Prime checking
(displayln "--- Prime Numbers ---")
(printf "prime?(7) = ~a\n" (prime? 7))
(printf "prime?(10) = ~a\n" (prime? 10))
(printf "prime?(97) = ~a\n" (prime? 97))
(displayln "")

;; GCD and LCM
(displayln "--- GCD & LCM ---")
(printf "gcd(48, 18) = ~a\n" (gcd 48 18))
(printf "lcm(4, 6) = ~a\n" (lcm 4 6))
(displayln "")

;; Sorting
(displayln "--- Sorting Algorithms ---")
(define unsorted '(64 34 25 12 22 11 90))
(printf "Original: ~a\n" unsorted)
(printf "Bubble sort: ~a\n" (bubble-sort unsorted))
(printf "Quick sort: ~a\n" (quick-sort unsorted))
(printf "Insertion sort: ~a\n" (insertion-sort unsorted))
(printf "Selection sort: ~a\n" (selection-sort unsorted))
(displayln "")

;; Morse Code
(displayln "--- Morse Code ---")
(printf "encode 'SOS' = ~a\n" (encode-to-morse "SOS"))
(printf "encode 'HELLO' = ~a\n" (encode-to-morse "HELLO"))
(displayln "")

;; Higher-Order Functions
(displayln "--- Higher-Order Functions ---")
(printf "filter even? '(1 2 3 4 5 6) = ~a\n" (filter even? '(1 2 3 4 5 6)))
(printf "map sqr '(1 2 3 4 5) = ~a\n" (map sqr '(1 2 3 4 5)))
(printf "foldl + 0 '(1 2 3 4 5) = ~a\n" (foldl + 0 '(1 2 3 4 5)))
(displayln "")

;; Arithmetic
(displayln "--- Arithmetic ---")
(printf "square(7) = ~a\n" (square 7))
(printf "cube(3) = ~a\n" (cube 3))
(displayln "")

(displayln "=== Examples Complete ===")
