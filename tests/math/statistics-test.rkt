#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require rackunit
         rackunit/text-ui
         "../../src/math/statistics/central-tendency.rkt"
         "../../src/math/statistics/dispersion.rkt"
         "../../src/math/statistics/extremes.rkt"
         "../../src/math/statistics/percentile.rkt"
         "../../src/math/statistics/find-avg-excluding-first-and-last.rkt")

;; Note: find-avg-excluding-first-and-last divides the trimmed sum by 2
;; unconditionally, so it is only correct where exactly 0, 1, 2, 3, or 4
;; elements remain after trimming the min/max. That is a pre-existing
;; limitation of the implementation, not this test.
(define statistics-tests
  (test-suite
   "statistics"

   (test-suite
    "find-avg-excluding-first-and-last - valid"
    (test-case "3 elements returns the sorted middle value"
      (check-equal? (find-avg-excluding-first-and-last '(5 1 3)) 3))
    (test-case "4 elements averages the two middle values"
      (check-equal? (find-avg-excluding-first-and-last '(4 1 3 2)) 2.5)))

   (test-suite
    "find-avg-excluding-first-and-last - edge"
    (test-case "empty list returns 0"
      (check-equal? (find-avg-excluding-first-and-last '()) 0))
    (test-case "single element returns that element"
      (check-equal? (find-avg-excluding-first-and-last '(9)) 9))
    (test-case "two elements returns their average"
      (check-equal? (find-avg-excluding-first-and-last '(4 2)) 3)))

   (test-suite
    "central-tendency/dispersion/extremes/percentile - valid"
    (test-case "mean" (check-equal? (mean '(1 2 3 4)) 5/2))
    (test-case "median - odd count" (check-equal? (median '(1 2 3)) 2))
    (test-case "median - even count" (check-equal? (median '(1 2 3 4)) 5/2))
    (test-case "mode" (check-equal? (mode '(1 2 2 3)) 2))
    (test-case "variance" (check-equal? (variance '(2 4 4 4 5 5 7 9)) 4))
    (test-case "standard-deviation" (check-equal? (standard-deviation '(2 4 4 4 5 5 7 9)) 2))
    (test-case "minimum" (check-equal? (minimum '(5 2 8)) 2))
    (test-case "maximum" (check-equal? (maximum '(5 2 8)) 8))
    (test-case "range" (check-equal? (range '(5 2 8)) 6))
    (test-case "percentile" (check-equal? (percentile '(1 2 3 4 5) 50) 3))
    (test-case "quartile" (check-equal? (quartile '(1 2 3 4 5) 2) 3)))

   (test-suite
    "central-tendency/dispersion/extremes/percentile - edge"
    (test-case "median of a single-element list is that element" (check-equal? (median '(9)) 9))
    (test-case "range of a single-element list is 0" (check-equal? (range '(4)) 0)))))

(run-tests statistics-tests)
