#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require rackunit
         rackunit/text-ui
         "../../src/math/arithmetic/abs.rkt"
         "../../src/math/arithmetic/add1.rkt"
         "../../src/math/arithmetic/cube.rkt"
         "../../src/math/arithmetic/double.rkt"
         "../../src/math/arithmetic/half.rkt"
         (only-in "../../src/math/arithmetic/min-max.rkt" min max)
         "../../src/math/arithmetic/reciprocal.rkt"
         "../../src/math/arithmetic/remainder.rkt"
         "../../src/math/arithmetic/square.rkt"
         "../../src/math/arithmetic/sum.rkt"
         "../../src/math/arithmetic/rational-nums.rkt"
         "../../src/math/arithmetic/sequences.rkt"
         "../../src/math/arithmetic/sqrt.rkt"
         "../../src/math/arithmetic/squares-list-by-limit.rkt"
         "../../src/math/arithmetic/separate-neg-and-pos.rkt"
         "../../src/math/arithmetic/generate-list-of-squares.rkt")

(define arithmetic-tests
  (test-suite
   "arithmetic"

   (test-suite
    "abs/add1/cube/double - valid"
    (test-case "absolute of a negative number" (check-equal? (absolute -5) 5))
    (test-case "absolute-list maps over a list" (check-equal? (absolute-list '(-1 2 -3)) '(1 2 3)))
    (test-case "increment adds 1" (check-equal? (increment 4) 5))
    (test-case "increment-list maps over a list" (check-equal? (increment-list '(1 2 3)) '(2 3 4)))
    (test-case "cube of 3 is 27" (check-equal? (cube 3) 27))
    (test-case "cube-list maps over a list" (check-equal? (cube-list '(1 2 3)) '(1 8 27)))
    (test-case "sum-of-cubes totals cubes in a list" (check-equal? (sum-of-cubes '(1 2 3)) 36))
    (test-case "double of 4 is 8" (check-equal? (double 4) 8))
    (test-case "double-list maps over a list" (check-equal? (double-list '(1 2 3)) '(2 4 6))))

   (test-suite
    "abs/add1/cube/double - edge"
    (test-case "absolute of 0 is 0" (check-equal? (absolute 0) 0))
    (test-case "increment of a negative number" (check-equal? (increment -1) 0))
    (test-case "cube of 0 is 0" (check-equal? (cube 0) 0))
    (test-case "cube of a negative number is negative" (check-equal? (cube -2) -8))
    (test-case "double of 0 is 0" (check-equal? (double 0) 0)))

   (test-suite
    "half - valid"
    (test-case "half(8) counts 3 halvings to reach 1" (check-equal? (half 8) 3))
    (test-case "halve(4) is 2" (check-equal? (halve 4) 2))
    (test-case "halve-list maps over a list" (check-equal? (halve-list '(2 4 6)) '(1 2 3))))

   (test-suite
    "half - edge"
    (test-case "half(1) needs 0 halvings" (check-equal? (half 1) 0))
    (test-case "half(0) needs 0 halvings" (check-equal? (half 0) 0))
    (test-case "halve of an odd number returns an exact fraction" (check-equal? (halve 5) 5/2)))

   (test-suite
    "min/max - valid"
    (test-case "min of two numbers" (check-equal? (min 3 7) 3))
    (test-case "max of two numbers" (check-equal? (max 3 7) 7)))

   (test-suite
    "min/max - edge"
    (test-case "min of equal numbers returns that number" (check-equal? (min 5 5) 5))
    (test-case "max of equal numbers returns that number" (check-equal? (max 5 5) 5)))

   (test-suite
    "reciprocal - valid"
    (test-case "reciprocal of 4 is 1/4" (check-equal? (reciprocal 4) 1/4))
    (test-case "reciprocal-lst-rec maps over a list" (check-equal? (reciprocal-lst-rec '(1 2 4)) '(1 1/2 1/4)))
    (test-case "reciprocal-lst-iter matches reciprocal-lst-rec"
      (check-equal? (reciprocal-lst-iter '(1 2 4)) (reciprocal-lst-rec '(1 2 4))))
    (test-case "reciprocal-lst-imper matches reciprocal-lst-rec"
      (check-equal? (reciprocal-lst-imper '(1 2 4)) (reciprocal-lst-rec '(1 2 4)))))

   (test-suite
    "reciprocal - edge"
    (test-case "reciprocal-lst-rec of an empty list" (check-equal? (reciprocal-lst-rec '()) '())))

   (test-suite
    "reciprocal - invalid"
    (test-case "reciprocal of 0 raises an error" (check-exn exn:fail? (lambda () (reciprocal 0)))))

   (test-suite
    "custom-remainder - valid"
    (test-case "custom-remainder(7, 3) is 1" (check-equal? (custom-remainder 7 3) 1))
    (test-case "custom-remainder differs from built-in remainder for negatives"
      (check-equal? (custom-remainder -7 3) 2)))

   (test-suite
    "custom-remainder - edge"
    (test-case "custom-remainder(0, 3) is 0" (check-equal? (custom-remainder 0 3) 0)))

   (test-suite
    "square - valid"
    (test-case "square of 5 is 25" (check-equal? (square 5) 25))
    (test-case "square-list maps over a list" (check-equal? (square-list '(1 2 3)) '(1 4 9)))
    (test-case "sum-of-squares totals squares in a list" (check-equal? (sum-of-squares '(1 2 3)) 14)))

   (test-suite
    "square - edge"
    (test-case "square of 0 is 0" (check-equal? (square 0) 0))
    (test-case "square of a negative number is positive" (check-equal? (square -3) 9)))

   (test-suite
    "sum - valid"
    (test-case "sum(5, 0) is 1+2+3+4+5" (check-equal? (sum 5 0) 15))
    (test-case "sum-list sums a non-empty list"
      (check-equal? (sum-list '(1 2 3 4)) 10)))

   (test-suite
    "sum - edge"
    (test-case "sum(0, 0) is 0" (check-equal? (sum 0 0) 0))
    (test-case "sum-list of an empty list is 0"
      (check-equal? (sum-list '()) 0)))

   (test-suite
    "rational-nums - valid"
    (test-case "make-rational normalizes by the gcd" (check-equal? (make-rational 4 8) (cons 1 2)))
    (test-case "rational-numerator/denominator accessors"
      (check-equal? (rational-numerator (cons 1 2)) 1)
      (check-equal? (rational-denominator (cons 1 2)) 2))
    (test-case "add-rational adds and normalizes"
      (check-equal? (add-rational (cons 1 2) (cons 1 3)) (cons 5 6)))
    (test-case "multiply-rational multiplies and normalizes"
      (check-equal? (multiply-rational (cons 1 2) (cons 1 3)) (cons 1 6))))

   (test-suite
    "rational-nums - edge"
    (test-case "make-rational fully reduces to a whole number" (check-equal? (make-rational 6 3) (cons 2 1))))

   (test-suite
    "sequences - valid"
    (test-case "simple-interest computes P*(1+rt)" (check-equal? (simple-interest 1000 2 0.05) 1100.0))
    (test-case "compound-interest computes P*(1+r)^t" (check-equal? (compound-interest 1000 2 0.05) 1102.5))
    (test-case "arithmetic-seq-sum of first n terms" (check-equal? (arithmetic-seq-sum 1 10 10) 55))
    (test-case "geometric-seq-sum of first n terms" (check-equal? (geometric-seq-sum 1 2 4) 15)))

   (test-suite
    "sequences - edge"
    (test-case "simple-interest with 0 rate returns the principal" (check-equal? (simple-interest 500 3 0) 500))
    (test-case "compound-interest with 0 time returns the principal" (check-equal? (compound-interest 500 0 0.05) 500)))

   (test-suite
    "sqrt/newton - valid (author-verified values)"
    (test-case "sqrt-root(4) approximates 2.0"
      (check-equal? (sqrt-root 4) 2.0000000929222947))
    (test-case "half-interval-method finds a root of sin between 2 and 4"
      (check-equal? (half-interval-method sin 2.0 4) 3.14111328125))
    (test-case "newton's method converges to sqrt(4)"
      (check-within (newton (lambda (x) (- (* x x) 4)) 1.0) 2.0 0.01))
    (test-case "deriv approximates d/dx(x^2) at x=3"
      (check-within ((deriv (lambda (x) (* x x)) 0.001) 3) 6.0 0.01)))

   (test-suite
    "sqrt/newton - invalid"
    (test-case "half-interval-method errors when endpoints share a sign"
      (check-exn exn:fail? (lambda () (half-interval-method sin 1.0 2.0)))))

   (test-suite
    "squares-list variants - valid"
    (test-case "squares-list for n=5"
      (check-equal? (squares-list 5) '(0 1 4 9 16)))
    (test-case "squares-list-range supports an arbitrary start"
      (check-equal? (squares-list-range 2 5) '(4 9 16)))
    (test-case "squares (generate-list-of-squares) matches squares-list"
      (check-equal? (squares 5) (squares-list 5))))

   (test-suite
    "squares-list variants - edge"
    (test-case "squares-list of 0 is empty" (check-equal? (squares-list 0) '()))
    (test-case "squares (generate-list-of-squares) of 0 is empty" (check-equal? (squares 0) '())))

   (test-suite
    "separate-neg-and-pos - valid"
    (test-case "separate-neg-and-pos splits and sorts both halves"
      (check-equal? (separate-neg-and-pos '(3 -1 -5 2)) (list '(-5 -1) '(2 3))))
    (test-case "neg-lst extracts the sorted negatives" (check-equal? (neg-lst '(3 -1 -5 2)) '(-5 -1)))
    (test-case "pos-lst extracts the sorted positives" (check-equal? (pos-lst '(3 -1 -5 2)) '(2 3))))

   (test-suite
    "separate-neg-and-pos - edge"
    (test-case "0 is treated as positive" (check-equal? (separate-neg-and-pos '(0 -1)) (list '(-1) '(0))))
    (test-case "an all-positive list has an empty negative half"
      (check-equal? (neg-lst '(1 2 3)) '())))))

(run-tests arithmetic-tests)

