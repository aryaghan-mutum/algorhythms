#lang racket

;; Author: Anurag Muthyam
;; Tests for the consolidated top-level math files: arithmetic.rkt,
;; algebra.rkt, geometry.rkt, trigonometry.rkt, statistics.rkt,
;; number-theory.rkt, matrix.rkt, financial.rkt.

(require rackunit
         rackunit/text-ui
         "../../src/math/arithmetic.rkt"
         "../../src/math/algebra.rkt"
         "../../src/math/geometry.rkt"
         "../../src/math/trigonometry.rkt"
         "../../src/math/statistics.rkt"
         "../../src/math/number-theory.rkt"
         "../../src/math/matrix.rkt"
         "../../src/math/financial.rkt")

(define arithmetic-tests
  (test-suite
   "arithmetic.rkt"
   (test-case "add - valid" (check-equal? (add 2 3) 5))
   (test-case "subtract - valid" (check-equal? (subtract 5 2) 3))
   (test-case "multiply - valid" (check-equal? (multiply 2 3) 6))
   (test-case "divide - valid" (check-equal? (divide 6 2) 3))
   (test-case "modulus - valid" (check-equal? (modulus 7 3) 1))
   (test-case "square - valid" (check-equal? (square 4) 16))
   (test-case "cube - valid" (check-equal? (cube 3) 27))
   (test-case "power - valid" (check-equal? (power 2 5) 32))
   (test-case "sqrt - valid" (check-equal? (sqrt 16) 4))
   (test-case "absolute - valid" (check-equal? (absolute -5) 5))
   (test-case "percentage - valid" (check-equal? (percentage 25 200) 25/2))
   (test-case "average - valid" (check-equal? (average (list 2 4 6)) 4))))

(define algebra-tests
  (test-suite
   "algebra.rkt"
   (test-case "solve-linear - valid" (check-equal? (solve-linear 2 -8) 4))
   (test-case "solve-quadratic - valid" (check-equal? (solve-quadratic 1 -3 2) (cons 2 1)))
   (test-case "evaluate-polynomial - valid" (check-equal? (evaluate-polynomial '(1 -3 2) 5) 12))
   (test-case "factor-expression - valid" (check-equal? (factor-expression '(6 9 12)) (list 3 '(2 3 4))))
   (test-case "expand-expression - valid" (check-equal? (expand-expression '(1 2) '(1 3)) '(1 5 6)))
   (test-case "simplify-expression - valid"
     (check-equal? (simplify-expression '((2 . 3) (1 . 2) (2 . -1) (0 . 0)))
                   '((2 . 2) (1 . 2))))))

(define geometry-tests
  (test-suite
   "geometry.rkt"
   (test-case "area-circle - valid" (check-within (area-circle 2) (* pi 4) 0.001))
   (test-case "circumference-circle - valid" (check-within (circumference-circle 2) (* 2 pi 2) 0.001))
   (test-case "area-square - valid" (check-equal? (area-square 3) 9))
   (test-case "perimeter-square - valid" (check-equal? (perimeter-square 3) 12))
   (test-case "area-rectangle - valid" (check-equal? (area-rectangle 3 4) 12))
   (test-case "perimeter-rectangle - valid" (check-equal? (perimeter-rectangle 3 4) 14))
   (test-case "area-triangle - valid" (check-equal? (area-triangle 4 5) 10.0))
   (test-case "perimeter-triangle - valid" (check-equal? (perimeter-triangle 3 4 5) 12))
   (test-case "volume-cube - valid" (check-equal? (volume-cube 2) 8))
   (test-case "volume-sphere - valid" (check-within (volume-sphere 2) (* 4/3 pi 8) 0.001))
   (test-case "volume-cylinder - valid" (check-within (volume-cylinder 2 5) (* pi 4 5) 0.001))
   (test-case "volume-cone - valid" (check-within (volume-cone 3 4) (* 1/3 pi 9 4) 0.001))))

(define trigonometry-tests
  (test-suite
   "trigonometry.rkt"
   (test-case "sin-deg - valid" (check-within (sin-deg 30) 0.5 0.0001))
   (test-case "cos-deg - valid" (check-within (cos-deg 60) 0.5 0.0001))
   (test-case "tan-deg - valid" (check-within (tan-deg 45) 1.0 0.0001))
   (test-case "asin-deg - valid" (check-within (asin-deg 0.5) 30.0 0.0001))
   (test-case "acos-deg - valid" (check-within (acos-deg 0.5) 60.0 0.0001))
   (test-case "atan-deg - valid" (check-within (atan-deg 1) 45.0 0.0001))
   (test-case "degrees->radians - valid" (check-within (degrees->radians 180) pi 0.0001))
   (test-case "radians->degrees - valid" (check-within (radians->degrees pi) 180.0 0.0001))
   (test-case "hypotenuse - valid" (check-equal? (hypotenuse 3 4) 5))))

(define statistics-tests
  (test-suite
   "statistics.rkt"
   (test-case "mean - valid" (check-equal? (mean '(1 2 3 4)) 5/2))
   (test-case "median - odd count" (check-equal? (median '(1 2 3)) 2))
   (test-case "median - even count" (check-equal? (median '(1 2 3 4)) 5/2))
   (test-case "mode - valid" (check-equal? (mode '(1 2 2 3)) 2))
   (test-case "variance - valid" (check-equal? (variance '(2 4 4 4 5 5 7 9)) 4))
   (test-case "standard-deviation - valid" (check-equal? (standard-deviation '(2 4 4 4 5 5 7 9)) 2))
   (test-case "minimum - valid" (check-equal? (minimum '(5 2 8)) 2))
   (test-case "maximum - valid" (check-equal? (maximum '(5 2 8)) 8))
   (test-case "range - valid" (check-equal? (range '(5 2 8)) 6))
   (test-case "percentile - valid" (check-equal? (percentile '(1 2 3 4 5) 50) 3))
   (test-case "quartile - valid" (check-equal? (quartile '(1 2 3 4 5) 2) 3))))

(define number-theory-tests
  (test-suite
   "number-theory.rkt"
   (test-case "is-prime? - valid" (check-true (is-prime? 17)))
   (test-case "is-prime? - invalid" (check-false (is-prime? 4)))
   (test-case "gcd - valid" (check-equal? (gcd 12 18) 6))
   (test-case "lcm - valid" (check-equal? (lcm 4 6) 12))
   (test-case "factorial - valid" (check-equal? (factorial 5) 120))
   (test-case "fibonacci - valid" (check-equal? (fibonacci 10) 55))
   (test-case "prime-factors - valid" (check-equal? (prime-factors 60) '(2 2 3 5)))
   (test-case "even? - valid" (check-true (even? 4)))
   (test-case "odd? - valid" (check-true (odd? 3)))
   (test-case "palindrome-number? - valid" (check-true (palindrome-number? 121)))
   (test-case "palindrome-number? - invalid" (check-false (palindrome-number? 123)))
   (test-case "reverse-number - valid" (check-equal? (reverse-number 123) 321))))

(define matrix-tests
  (test-suite
   "matrix.rkt"
   (test-case "matrix-add - valid" (check-equal? (matrix-add '((1 2) (3 4)) '((5 6) (7 8))) '((6 8) (10 12))))
   (test-case "matrix-subtract - valid" (check-equal? (matrix-subtract '((5 6) (7 8)) '((1 2) (3 4))) '((4 4) (4 4))))
   (test-case "matrix-multiply - valid" (check-equal? (matrix-multiply '((1 2) (3 4)) '((5 6) (7 8))) '((19 22) (43 50))))
   (test-case "matrix-transpose - valid" (check-equal? (matrix-transpose '((1 2) (3 4))) '((1 3) (2 4))))
   (test-case "matrix-determinant - valid" (check-equal? (matrix-determinant '((1 2) (3 4))) -2))
   (test-case "matrix-inverse - valid"
     (check-equal? (matrix-inverse '((4 7) (2 6))) (list (list 3/5 -7/10) (list -1/5 2/5))))
   (test-case "identity-matrix - valid" (check-equal? (identity-matrix 3) '((1 0 0) (0 1 0) (0 0 1))))))

(define financial-tests
  (test-suite
   "financial.rkt"
   (test-case "simple-interest - valid" (check-equal? (simple-interest 1000 2 0.05) 1100.0))
   (test-case "compound-interest - valid" (check-equal? (compound-interest 1000 2 0.05) 1102.5))
   (test-case "roi - valid" (check-equal? (roi 1200 1000) 1/5))
   (test-case "emi - valid" (check-within (emi 100000 0.01 12) 8884.88 0.01))
   (test-case "future-value - valid" (check-equal? (future-value 1000 0.05 2) 1102.5))
   (test-case "present-value - valid" (check-equal? (present-value 1102.5 0.05 2) 1000.0))
   (test-case "npv - valid" (check-within (npv 0.1 '(-1000 400 400 400 400)) 267.95 0.01))
   (test-case "irr - valid" (check-within (irr '(-1000 400 400 400 400)) 0.2186 0.001))))

(run-tests arithmetic-tests)
(run-tests algebra-tests)
(run-tests geometry-tests)
(run-tests trigonometry-tests)
(run-tests statistics-tests)
(run-tests number-theory-tests)
(run-tests matrix-tests)
(run-tests financial-tests)
