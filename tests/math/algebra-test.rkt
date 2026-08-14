#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require rackunit
         rackunit/text-ui
         "../../src/math/algebra/expt.rkt"
         "../../src/math/algebra/polynomial.rkt"
         "../../src/math/algebra/quadratic-formula.rkt"
         "../../src/math/algebra/solve-linear.rkt"
         "../../src/math/algebra/mutable-matrix.rkt")

(define algebra-tests
  (test-suite
   "algebra"

   (test-suite
    "expt variants - valid"
    (test-case "fast-expt(2,10) is 1024" (check-equal? (fast-expt 2 10) 1024))
    (test-case "fast-expt with a decimal base" (check-equal? (fast-expt 1.5 2) 2.25)))

   (test-suite
    "expt variants - edge"
    (test-case "fast-expt(b,0) is 1" (check-equal? (fast-expt 5 0) 1))
    (test-case "fast-expt(0,0) is 1 (by convention)" (check-equal? (fast-expt 0 0) 1)))

   (test-suite
    "expt variants - invalid"
    (test-case "fast-expt errors instead of looping forever on a negative exponent"
      (check-exn exn:fail? (lambda () (fast-expt 2 -3))))
    (test-case "fast-expt errors on a non-integer decimal exponent"
      (check-exn exn:fail? (lambda () (fast-expt 2 2.5)))))

   (test-suite
    "expt-log/half-exponential/log-reach-to-num - edge"
    (test-case "expt-log(0) returns 0" (check-equal? (expt-log 0) 0))
    (test-case "expt-log(n>=1) bottoms out at 1" (check-equal? (expt-log 5) 1))
    (test-case "half-exponential(0) is 1" (check-equal? (half-exponential 0) 1))
    (test-case "half-exponential(5) is 1" (check-equal? (half-exponential 5) 1))
    (test-case "log-reach-to-num(0) takes 4 steps"
      (check-equal? (log-reach-to-num 0) 4)))

   (test-suite
    "expt-log/half-exponential - invalid"
    (test-case "half-exponential errors instead of looping forever on negative input"
      (check-exn exn:fail? (lambda () (half-exponential -3))))
    (test-case "half-exponential reports non-integer input instead of erroring"
      (check-equal? (half-exponential 2.5) (void))))

   (test-suite
    "quadratic-formula - valid"
    (test-case "quadratic-formula solves x^2-3x+2=0 (roots 1,2)"
      (check-equal? (quadratic-formula 1 -3 2) (cons 2 1)))
    (test-case "quadratic-formula with decimal coefficients"
      (check-equal? (quadratic-formula 1.0 -3.0 2.0) (cons 2.0 1.0))))

   (test-suite
    "quadratic-formula - edge"
    (test-case "a perfect-square discriminant gives a repeated root"
      (check-equal? (quadratic-formula 1 -2 1) (cons 1 1)))
    (test-case "a negative discriminant gives complex roots"
      (check-equal? (quadratic-formula 1 0 1) (cons 0+1i 0-1i))))

   (test-suite
    "quadratic-formula - invalid"
    (test-case "a=0 is not a quadratic equation and raises an error"
      (check-exn exn:fail? (lambda () (quadratic-formula 0 2 4)))))

   (test-suite
    "solve-linear/solve-quadratic/polynomial - valid"
    (test-case "solve-linear solves 2x-8=0" (check-equal? (solve-linear 2 -8) 4))
    (test-case "solve-linear with a decimal coefficient" (check-equal? (solve-linear 2.5 5.0) -2.0))
    (test-case "solve-quadratic is an alias of quadratic-formula"
      (check-equal? (solve-quadratic 1 -3 2) (cons 2 1)))
    (test-case "evaluate-polynomial via Horner's method"
      (check-equal? (evaluate-polynomial '(1 -3 2) 5) 12))
    (test-case "factor-expression factors out the gcd"
      (check-equal? (factor-expression '(6 9 12)) (list 3 '(2 3 4))))
    (test-case "expand-expression multiplies two polynomials"
      (check-equal? (expand-expression '(1 2) '(1 3)) '(1 5 6)))
    (test-case "simplify-expression combines like terms and drops zeros"
      (check-equal? (simplify-expression '((2 . 3) (1 . 2) (2 . -1) (0 . 0)))
                    '((2 . 2) (1 . 2)))))

   (test-suite
    "solve-linear/polynomial - edge"
    (test-case "evaluate-polynomial of an empty coefficient list is 0"
      (check-equal? (evaluate-polynomial '() 5) 0))
    (test-case "factor-expression of all-zero coefficients is left unfactored"
      (check-equal? (factor-expression '(0 0 0)) (list 1 '(0 0 0))))
    (test-case "factor-expression of negative coefficients" (check-equal? (factor-expression '(-6 -9)) (list 3 '(-2 -3))))
    (test-case "simplify-expression of an empty term list is empty"
      (check-equal? (simplify-expression '()) '())))

   (test-suite
    "solve-linear/polynomial - invalid"
    (test-case "solve-linear errors when a=0 (not a linear equation in x)"
      (check-exn exn:fail? (lambda () (solve-linear 0 5))))
    (test-case "expand-expression of two empty polynomials is a degenerate case (documented, not silently wrong)"
      (check-exn exn:fail? (lambda () (expand-expression '() '())))))

   (test-suite
    "mutable-matrix - valid"
    (test-case "make-matrix default-fills with 0 and reports correct dimensions"
      (let ([m (make-matrix 2 3)])
        (check-equal? (matrix-rows m) 2)
        (check-equal? (matrix-cols m) 3)
        (check-equal? (matrix-ref m 0 0) 0)))
    (test-case "make-matrix with a fill value"
      (let ([m (make-matrix 2 2 9)])
        (check-equal? (matrix-ref m 1 1) 9)))
    (test-case "matrix-set! mutates the target cell"
      (let ([m (make-matrix 2 2)])
        (matrix-set! m 0 1 42)
        (check-equal? (matrix-ref m 0 1) 42))))

   (test-suite
    "mutable-matrix - edge"
    (test-case "matrix-set! only affects the targeted cell"
      (let ([m (make-matrix 2 2 0)])
        (matrix-set! m 0 0 7)
        (check-equal? (matrix-ref m 0 1) 0)))
    (test-case "make-matrix of size 0x0" (check-equal? (matrix-rows (make-matrix 0 0)) 0)))

   (test-suite
    "mutable-matrix - invalid"
    (test-case "make-matrix errors on a negative row count"
      (check-exn exn:fail:contract? (lambda () (make-matrix -1 2))))
    (test-case "matrix-ref errors on an out-of-range index"
      (check-exn exn:fail:contract? (lambda () (matrix-ref (make-matrix 2 2) 5 5)))))))

(run-tests algebra-tests)
