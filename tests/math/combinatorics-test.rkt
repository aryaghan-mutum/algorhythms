#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require rackunit
         rackunit/text-ui
         "../../math/combinatorics/factorial.rkt"
         "../../math/combinatorics/rotations.rkt"
         "../../math/combinatorics/permutations.rkt"
         "../../math/combinatorics/pascal-triangle.rkt")

(define combinatorics-tests
  (test-suite
   "combinatorics"

   (test-suite
    "factorial - valid"
    (test-case "0! is 1 (base case)" (check-equal? (factorial 0) 1))
    (test-case "1! is 1" (check-equal? (factorial 1) 1))
    (test-case "5! is 120" (check-equal? (factorial 5) 120))
    (test-case "10! is 3628800" (check-equal? (factorial 10) 3628800)))

   (test-suite
    "factorial - edge"
    (test-case "large input stays exact (25!)"
      (check-equal? (factorial 25) 15511210043330985984000000)))

   (test-suite
    "factorial - invalid"
    (test-case "negative input violates the natural-number contract"
      (check-exn exn:fail:contract? (lambda () (factorial -1)))))

   (test-suite
    "rotations - valid"
    (test-case "rotations of a 3-element list"
      (check-equal? (rotations '(1 2 3)) '((1 2 3) (2 3 1) (3 1 2))))
    (test-case "rotations-for-num keeps only prime rotations"
      (check-equal? (rotations-for-num 13) '((3 1) (1 3)))))

   (test-suite
    "rotations - edge"
    (test-case "rotations of a single-element list"
      (check-equal? (rotations '(1)) '((1))))
    (test-case "rotations of an empty list"
      (check-equal? (rotations '()) '()))
    (test-case "rotations-for-num with no prime rotations"
      (check-equal? (rotations-for-num 4) '())))

   (test-suite
    "permutations - valid"
    (test-case "unique-permutations of distinct elements has n! results"
      (check-equal? (length (unique-permutations '(1 2 3))) 6))
    (test-case "unique-permutations dedupes repeated elements"
      (check-equal? (length (unique-permutations '(1 1 2))) 3))
    (test-case "make-rpn frames a permutation as a valid RPN token list"
      (check-true (valid-rpn? (make-rpn '(1 2)))))
    (test-case "valid-rpn? accepts a balanced token sequence"
      (check-true (valid-rpn? '(1 1 -1)))))

   (test-suite
    "permutations - edge"
    (test-case "unique-permutations of an empty list"
      (check-equal? (unique-permutations '()) '(())))
    (test-case "make-rpn of an empty list is still balanced"
      (check-equal? (make-rpn '()) '(1 1 -1))))

   (test-suite
    "permutations - invalid"
    (test-case "valid-rpn? rejects an unbalanced token sequence"
      (check-false (valid-rpn? '(1 -1 -1)))))

   (test-suite
    "pascal-triangle - valid"
    (test-case "row 1 is just (1)"
      (check-equal? (pascal-triangle 1) '(1)))
    (test-case "row 3 has the expected binomial coefficients"
      (check-equal? (pascal-triangle 3) '((1) (1 1) (1 2 1))))
    (test-case "row 4 has the expected binomial coefficients"
      (check-equal? (pascal-triangle 4) '((1) (1 1) (1 2 1) (1 3 3 1)))))

   (test-suite
    "pascal-triangle - edge"
    (test-case "row 2 is the minimal two-row triangle"
      (check-equal? (pascal-triangle 2) '((1) (1 1)))))))

(run-tests combinatorics-tests)

