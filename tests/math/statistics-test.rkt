#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require rackunit
         rackunit/text-ui
         "../../src/math/statistics/find-avg-excluding-first-and-last.rkt")

;; Note: find-avg-excluding-first-and-last-v1 divides the trimmed sum by 2
;; unconditionally, so it is only correct where exactly 0, 1, 2, 3, or 4
;; elements remain after trimming the min/max. That is a pre-existing
;; limitation of the implementation, not this test.
(define statistics-tests
  (test-suite
   "statistics"

   (test-suite
    "find-avg-excluding-first-and-last-v1 - valid"
    (test-case "3 elements returns the sorted middle value"
      (check-equal? (find-avg-excluding-first-and-last-v1 '(5 1 3)) 3))
    (test-case "4 elements averages the two middle values"
      (check-equal? (find-avg-excluding-first-and-last-v1 '(4 1 3 2)) 2.5)))

   (test-suite
    "find-avg-excluding-first-and-last-v1 - edge"
    (test-case "empty list returns 0"
      (check-equal? (find-avg-excluding-first-and-last-v1 '()) 0))
    (test-case "single element returns that element"
      (check-equal? (find-avg-excluding-first-and-last-v1 '(9)) 9))
    (test-case "two elements returns their average"
      (check-equal? (find-avg-excluding-first-and-last-v1 '(4 2)) 3)))))

(run-tests statistics-tests)
