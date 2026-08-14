#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require rackunit
         rackunit/text-ui
         "../../src/math/arithmetic/abs.rkt"
         "../../src/math/arithmetic/add1.rkt"
         "../../src/math/arithmetic/average.rkt"
         "../../src/math/arithmetic/cube.rkt"
         "../../src/math/arithmetic/double.rkt"
         "../../src/math/arithmetic/half.rkt"
         "../../src/math/arithmetic/min-max.rkt"
         "../../src/math/arithmetic/operators.rkt"
         "../../src/math/arithmetic/percentage.rkt"
         "../../src/math/arithmetic/power.rkt"
         "../../src/math/arithmetic/reciprocal.rkt"
         "../../src/math/arithmetic/remainder.rkt"
         "../../src/math/arithmetic/square.rkt"
         "../../src/math/arithmetic/sum.rkt"
         "../../src/math/arithmetic/sum-of-cubes-in-range.rkt"
         "../../src/math/arithmetic/rational-nums.rkt"
         "../../src/math/arithmetic/sequences.rkt"
         "../../src/math/arithmetic/sqrt.rkt"
         "../../src/math/arithmetic/numerical-methods.rkt"
         "../../src/math/arithmetic/squares-in-range.rkt"
         "../../src/math/arithmetic/separate-neg-and-pos.rkt")

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
    (test-case "absolute of a decimal" (check-equal? (absolute -4.5) 4.5))
    (test-case "increment of a negative number" (check-equal? (increment -1) 0))
    (test-case "increment of a decimal" (check-equal? (increment 1.5) 2.5))
    (test-case "cube of 0 is 0" (check-equal? (cube 0) 0))
    (test-case "cube of a negative number is negative" (check-equal? (cube -2) -8))
    (test-case "cube of a decimal" (check-equal? (cube 1.5) 3.375))
    (test-case "double of 0 is 0" (check-equal? (double 0) 0))
    (test-case "double of a negative decimal" (check-equal? (double -1.5) -3.0)))

   (test-suite
    "half - valid"
    (test-case "halving-count(8) counts 3 halvings to reach 1" (check-equal? (halving-count 8) 3))
    (test-case "halve(4) is 2" (check-equal? (halve 4) 2))
    (test-case "halve-list maps over a list" (check-equal? (halve-list '(2 4 6)) '(1 2 3))))

   (test-suite
    "half - edge"
    (test-case "halving-count(1) needs 0 halvings" (check-equal? (halving-count 1) 0))
    (test-case "halving-count(0) needs 0 halvings" (check-equal? (halving-count 0) 0))
    (test-case "halve of an odd number returns an exact fraction" (check-equal? (halve 5) 5/2))
    (test-case "halve of a negative number" (check-equal? (halve -4) -2))
    (test-case "halve of a decimal" (check-equal? (halve 5.0) 2.5)))

   (test-suite
    "half - invalid"
    (test-case "halving-count errors instead of looping forever on negative input"
      (check-exn exn:fail? (lambda () (halving-count -8)))))

   (test-suite
    "min/max - valid"
    (test-case "min-custom of two numbers" (check-equal? (min-custom 3 7) 3))
    (test-case "max-custom of two numbers" (check-equal? (max-custom 3 7) 7))
    (test-case "pick-by-predicate returns a when the predicate holds"
      (check-equal? (pick-by-predicate 3 7 <) 3))
    (test-case "pick-by-predicate returns b when the predicate fails"
      (check-equal? (pick-by-predicate 3 7 >) 7)))

   (test-suite
    "min/max - edge"
    (test-case "min-custom of equal numbers returns that number" (check-equal? (min-custom 5 5) 5))
    (test-case "max-custom of equal numbers returns that number" (check-equal? (max-custom 5 5) 5))
    (test-case "min-custom of two negative numbers" (check-equal? (min-custom -5 -2) -5))
    (test-case "max-custom of decimals" (check-equal? (max-custom 1.5 2.5) 2.5)))

   (test-suite
    "min/max - re-exported built-ins are variadic (not shadowed by the 2-arg custom pair)"
    (test-case "min accepts more than two arguments" (check-equal? (min 5 1 3) 1))
    (test-case "max accepts more than two arguments" (check-equal? (max 5 1 3) 5)))

   (test-suite
    "reciprocal - valid"
    (test-case "reciprocal of 4 is 1/4" (check-equal? (reciprocal 4) 1/4))
    (test-case "reciprocal-list maps over a list" (check-equal? (reciprocal-list '(1 2 4)) '(1 1/2 1/4))))

   (test-suite
    "reciprocal - edge"
    (test-case "reciprocal-list of an empty list" (check-equal? (reciprocal-list '()) '()))
    (test-case "reciprocal of a negative number" (check-equal? (reciprocal -4) -1/4))
    (test-case "reciprocal-list of negative numbers" (check-equal? (reciprocal-list '(-2 -4)) '(-1/2 -1/4)))
    (test-case "reciprocal of a decimal" (check-equal? (reciprocal 4.0) 0.25)))

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
    (test-case "custom-remainder(0, 3) is 0" (check-equal? (custom-remainder 0 3) 0))
    (test-case "custom-remainder with both operands negative" (check-equal? (custom-remainder -7 -3) -1))
    (test-case "custom-remainder with a decimal dividend" (check-equal? (custom-remainder 7.5 2) 1.5)))

   (test-suite
    "square - valid"
    (test-case "square of 5 is 25" (check-equal? (square 5) 25))
    (test-case "square-list maps over a list" (check-equal? (square-list '(1 2 3)) '(1 4 9)))
    (test-case "sum-of-squares totals squares in a list" (check-equal? (sum-of-squares '(1 2 3)) 14)))

   (test-suite
    "square - edge"
    (test-case "square of 0 is 0" (check-equal? (square 0) 0))
    (test-case "square of a negative number is positive" (check-equal? (square -3) 9))
    (test-case "square of a decimal" (check-equal? (square 1.5) 2.25)))

   (test-suite
    "sum - valid"
    (test-case "sum-to-n(5) is 1+2+3+4+5" (check-equal? (sum-to-n 5) 15))
    (test-case "sum-list sums a non-empty list"
      (check-equal? (sum-list '(1 2 3 4)) 10)))

   (test-suite
    "sum - edge"
    (test-case "sum-to-n(0) is 0" (check-equal? (sum-to-n 0) 0))
    (test-case "sum-list of an empty list is 0"
      (check-equal? (sum-list '()) 0))
    (test-case "sum-list with negative elements" (check-equal? (sum-list '(-1 -2 3)) 0)))

   (test-suite
    "sum - invalid"
    (test-case "sum-to-n errors instead of looping forever on negative input"
      (check-exn exn:fail? (lambda () (sum-to-n -3))))
    (test-case "sum-to-n errors instead of looping forever on a decimal input"
      (check-exn exn:fail? (lambda () (sum-to-n 4.5)))))

   (test-suite
    "sum-of-cubes-in-range - valid"
    (test-case "sum of cubes 1..5 is 225" (check-equal? (sum-of-cubes-in-range 1 5) 225)))

   (test-suite
    "sum-of-cubes-in-range - edge"
    (test-case "an empty range (a > b) sums to 0" (check-equal? (sum-of-cubes-in-range 5 1) 0))
    (test-case "a range symmetric around 0 sums to 0" (check-equal? (sum-of-cubes-in-range -2 2) 0)))

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
    (test-case "make-rational fully reduces to a whole number" (check-equal? (make-rational 6 3) (cons 2 1)))
    (test-case "make-rational does not itself reject a zero denominator (documented gap, not a crash)"
      (check-equal? (make-rational 4 0) (cons 1 0))))

   (test-suite
    "sequences - valid"
    (test-case "arithmetic-seq-sum of first n terms" (check-equal? (arithmetic-seq-sum 1 10 10) 55))
    (test-case "geometric-seq-sum of first n terms" (check-equal? (geometric-seq-sum 1 2 4) 15)))

   (test-suite
    "sequences - edge"
    (test-case "geometric-seq-sum with a single term returns the first term"
      (check-equal? (geometric-seq-sum 5 2 1) 5)))

   (test-suite
    "sqrt/numerical-methods - valid (author-verified values)"
    (test-case "sqrt-root(4) approximates 2.0"
      (check-equal? (sqrt-root 4) 2.0000000929222947))
    (test-case "half-interval-method finds a root of sin between 2 and 4"
      (check-equal? (half-interval-method sin 2.0 4) 3.14111328125))
    (test-case "newton's method converges to sqrt(4)"
      (check-within (newton (lambda (x) (- (* x x) 4)) 1.0) 2.0 0.01))
    (test-case "deriv approximates d/dx(x^2) at x=3"
      (check-within ((deriv (lambda (x) (* x x)) 0.001) 3) 6.0 0.01)))

   (test-suite
    "sqrt/numerical-methods - edge"
    (test-case "sqrt-root(0) converges to within its own tolerance of 0"
      (check-within (sqrt-root 0) 0 0.01))
    (test-case "sqrt-root of a decimal approximates the real square root"
      (check-within (sqrt-root 2.5) 1.5811388300841898 0.001)))

   (test-suite
    "sqrt/numerical-methods - invalid"
    (test-case "half-interval-method errors when endpoints share a sign"
      (check-exn exn:fail? (lambda () (half-interval-method sin 1.0 2.0))))
    (test-case "sqrt-root errors instead of looping forever on negative input"
      (check-exn exn:fail? (lambda () (sqrt-root -4)))))

   (test-suite
    "squares-in-range - valid"
    (test-case "squares-from-zero for n=5"
      (check-equal? (squares-from-zero 5) '(0 1 4 9 16)))
    (test-case "squares-in-range supports an arbitrary start"
      (check-equal? (squares-in-range 2 5) '(4 9 16))))

   (test-suite
    "squares-in-range - edge"
    (test-case "squares-from-zero of 0 is empty" (check-equal? (squares-from-zero 0) '()))
    (test-case "squares-in-range supports a negative start"
      (check-equal? (squares-in-range -3 3) '(9 4 1 0 1 4))))

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
      (check-equal? (neg-lst '(1 2 3)) '())))

   (test-suite
    "operators/percentage/average/power - valid"
    (test-case "add" (check-equal? (add 2 3) 5))
    (test-case "subtract" (check-equal? (subtract 5 2) 3))
    (test-case "multiply" (check-equal? (multiply 2 3) 6))
    (test-case "divide" (check-equal? (divide 6 2) 3))
    (test-case "modulus" (check-equal? (modulus 7 3) 1))
    (test-case "percentage" (check-equal? (percentage 25 200) 25/2))
    (test-case "average" (check-equal? (average '(2 4 6)) 4))
    (test-case "power" (check-equal? (power 2 5) 32))
    (test-case "sqrt" (check-equal? (sqrt 16) 4)))

   (test-suite
    "operators/percentage/average/power - edge"
    (test-case "divide by a negative denominator" (check-equal? (divide 6 -2) -3))
    (test-case "average of a single-element list is that element" (check-equal? (average '(7)) 7))
    (test-case "power to the zeroth returns 1" (check-equal? (power 5 0) 1))
    (test-case "add/subtract/multiply with decimals" (check-equal? (add 1.5 2.5) 4.0)))

   (test-suite
    "operators/percentage/average - invalid"
    (test-case "divide by zero raises an error" (check-exn exn:fail? (lambda () (divide 5 0))))
    (test-case "percentage of a zero whole raises an error" (check-exn exn:fail? (lambda () (percentage 5 0))))
    (test-case "average of an empty list raises an error" (check-exn exn:fail? (lambda () (average '())))))))

(run-tests arithmetic-tests)

