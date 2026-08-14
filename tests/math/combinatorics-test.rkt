#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require rackunit
         rackunit/text-ui
         "../../src/math/combinatorics/factorial.rkt"
         "../../src/math/combinatorics/rotations.rkt"
         "../../src/math/combinatorics/permutations.rkt"
         "../../src/math/combinatorics/pascal-triangle.rkt")

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
      (check-exn exn:fail:contract? (lambda () (factorial -1))))
    (test-case "decimal input violates the natural-number contract"
      (check-exn exn:fail:contract? (lambda () (factorial 4.5)))))

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
      (check-equal? (rotations-for-num 4) '()))
    (test-case "rotations-for-num(0) has no prime rotations"
      (check-equal? (rotations-for-num 0) '())))

   (test-suite
    "rotations - invalid"
    (test-case "rotations-for-num of a negative number yields no matches (documented, not an error)"
      (check-equal? (rotations-for-num -13) '()))
    (test-case "rotations-for-num errors on a non-integer decimal input"
      (check-exn exn:fail:contract? (lambda () (rotations-for-num 13.5)))))

   (test-suite
    "permutations - valid"
    (test-case "unique-permutations of distinct elements has n! results"
      (check-equal? (length (unique-permutations '(1 2 3))) 6))
    (test-case "unique-permutations dedupes repeated elements"
      (check-equal? (length (unique-permutations '(1 1 2))) 3))
    (test-case "make-rpn wraps a list with the 1 1 ... -1 frame"
      (check-equal? (make-rpn '(5 6)) '(1 1 5 6 -1)))
    (test-case "valid-rpn? accepts a single operand token"
      (check-true (valid-rpn? '(1))))
    (test-case "valid-rpn? accepts this specific balanced token run"
      (check-true (valid-rpn? '(1 -1 -1)))))

   (test-suite
    "permutations - edge"
    (test-case "unique-permutations of an empty list"
      (check-equal? (unique-permutations '()) '(())))
    (test-case "make-rpn of an empty list is still balanced"
      (check-equal? (make-rpn '()) '(1 1 -1))))

   (test-suite
    "permutations - invalid"
    (test-case "valid-rpn? rejects two operand tokens in a row"
      (check-false (valid-rpn? '(1 1))))
    (test-case "valid-rpn? currently rejects a plain operand-operand-operator run too (FLAGGED as likely inconsistent with real RPN semantics -- see permutations.rkt; this documents actual behavior, not an endorsed correctness spec)"
      (check-false (valid-rpn? '(1 1 -1))))
    (test-case "valid-rpn? currently rejects make-rpn's own output -- see the same flag"
      (check-false (valid-rpn? (make-rpn '(5 6))))))

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
      (check-equal? (pascal-triangle 2) '((1) (1 1)))))

   (test-suite
    "pascal-triangle - invalid"
    (test-case "pascal-triangle errors instead of looping forever on row 0"
      (check-exn exn:fail? (lambda () (pascal-triangle 0))))
    (test-case "pascal-triangle errors instead of looping forever on a negative row"
      (check-exn exn:fail? (lambda () (pascal-triangle -1))))
    (test-case "pascal-triangle errors instead of looping forever on a decimal row"
      (check-exn exn:fail? (lambda () (pascal-triangle 2.5)))))))

(run-tests combinatorics-tests)

