#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require rackunit
         rackunit/text-ui
         "../../src/math/matrix/basic-ops.rkt"
         "../../src/math/matrix/multiply.rkt"
         "../../src/math/matrix/transpose.rkt"
         "../../src/math/matrix/determinant.rkt"
         "../../src/math/matrix/inverse.rkt"
         "../../src/math/matrix/identity.rkt")

(define matrix-tests
  (test-suite
   "matrix"

   (test-suite
    "basic-ops/multiply/transpose - valid"
    (test-case "matrix-add" (check-equal? (matrix-add '((1 2) (3 4)) '((5 6) (7 8))) '((6 8) (10 12))))
    (test-case "matrix-subtract" (check-equal? (matrix-subtract '((5 6) (7 8)) '((1 2) (3 4))) '((4 4) (4 4))))
    (test-case "matrix-multiply" (check-equal? (matrix-multiply '((1 2) (3 4)) '((5 6) (7 8))) '((19 22) (43 50))))
    (test-case "matrix-transpose" (check-equal? (matrix-transpose '((1 2) (3 4))) '((1 3) (2 4)))))

   (test-suite
    "determinant/inverse/identity - valid"
    (test-case "matrix-determinant of a 2x2 matrix" (check-equal? (matrix-determinant '((1 2) (3 4))) -2))
    (test-case "matrix-determinant of a 1x1 matrix" (check-equal? (matrix-determinant '((5))) 5))
    (test-case "matrix-inverse" (check-equal? (matrix-inverse '((4 7) (2 6))) (list (list 3/5 -7/10) (list -1/5 2/5))))
    (test-case "identity-matrix" (check-equal? (identity-matrix 3) '((1 0 0) (0 1 0) (0 0 1)))))

   (test-suite
    "determinant/inverse/identity - edge"
    (test-case "identity-matrix of size 1" (check-equal? (identity-matrix 1) '((1)))))))

(run-tests matrix-tests)
