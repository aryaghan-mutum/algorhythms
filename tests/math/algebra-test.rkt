#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require rackunit
         rackunit/text-ui
         "../../math/algebra/expt.rkt"
         "../../math/algebra/quadratic-formula.rkt"
         "../../math/algebra/matrices.rkt")

(define algebra-tests
  (test-suite
   "algebra"

   (test-suite
    "expt variants - valid"
    (test-case "expt-v1(2,3) is 8" (check-equal? (expt-v1 2 3) 8))
    (test-case "expt-v2(2,3) is 8" (check-equal? (expt-v2 2 3) 8))
    (test-case "expt-v3(2,3) is 8" (check-equal? (expt-v3 2 3) 8))
    (test-case "expt-v3 supports negative exponents" (check-equal? (expt-v3 2 -2) 1/4))
    (test-case "expt-v4(2,5) is 32" (check-equal? (expt-v4 2 5) 32))
    (test-case "expt-v5(2,4) is 16" (check-equal? (expt-v5 2 4) 16))
    (test-case "expt-v6(2,5) is 32" (check-equal? (expt-v6 2 5) 32))
    (test-case "fast-expt-v7(2,10) is 1024" (check-equal? (fast-expt-v7 2 10) 1024))
    (test-case "fast-expt-v8(2,10) is 1024" (check-equal? (fast-expt-v8 2 10) 1024)))

   (test-suite
    "expt variants - edge"
    (test-case "expt-v1(b,0) is 1" (check-equal? (expt-v1 5 0) 1))
    (test-case "expt-v4(b,0) is 1" (check-equal? (expt-v4 5 0) 1))
    (test-case "fast-expt-v7(b,0) is 1" (check-equal? (fast-expt-v7 5 0) 1))
    (test-case "fast-expt-v8(b,0) is 1" (check-equal? (fast-expt-v8 5 0) 1)))

   (test-suite
    "expt-log/half-exponential/log-reach-to-num - edge"
    (test-case "expt-log(0) returns 0" (check-equal? (expt-log 0) 0))
    (test-case "expt-log(n>=1) bottoms out at 1" (check-equal? (expt-log 5) 1))
    (test-case "half-exponential(0) is 1" (check-equal? (half-exponential 0) 1))
    (test-case "half-exponential(5) is 1" (check-equal? (half-exponential 5) 1))
    (test-case "log-reach-to-num(0) takes 4 steps"
      (check-equal? (log-reach-to-num 0) 4)))

   (test-suite
    "quadratic-formula - valid"
    (test-case "quadratic-formula-v1 solves x^2-3x+2=0 (roots 1,2)"
      (check-equal? (quadratic-formula-v1 1 -3 2) (cons 2 1)))
    (test-case "quadratic-formula-v2 matches v1 for the same inputs"
      (check-equal? (quadratic-formula-v2 1 -3 2) (quadratic-formula-v1 1 -3 2))))

   (test-suite
    "quadratic-formula - edge"
    (test-case "a perfect-square discriminant gives a repeated root"
      (check-equal? (quadratic-formula-v1 1 -2 1) (cons 1 1))))

   (test-suite
    "matrices - valid"
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
    "matrices - edge"
    (test-case "matrix-set! only affects the targeted cell"
      (let ([m (make-matrix 2 2 0)])
        (matrix-set! m 0 0 7)
        (check-equal? (matrix-ref m 0 1) 0))))))

(run-tests algebra-tests)
