#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require rackunit
         rackunit/text-ui
         "../../src/data-structures/sort/bubble-sort.rkt"
         "../../src/data-structures/sort/insertion-sort.rkt"
         "../../src/data-structures/sort/quick-sort.rkt"
         "../../src/data-structures/sort/selection-sort.rkt")

(define sort-tests
  (test-suite
   "Sorting algorithms"

   (test-suite
    "bubble-sort"
    (test-suite "- valid"
      (test-case "ascending with <"
        (check-equal? (bubble-sort '(3 1 4 1 5 9 2 6) <) '(1 1 2 3 4 5 6 9)))
      (test-case "descending with >"
        (check-equal? (bubble-sort '(3 1 4 1 5) >) '(5 4 3 1 1))))
    (test-suite "- edge"
      (test-case "empty" (check-equal? (bubble-sort '() <) '()))
      (test-case "single" (check-equal? (bubble-sort '(7) <) '(7)))
      (test-case "already sorted" (check-equal? (bubble-sort '(1 2 3) <) '(1 2 3)))
      (test-case "reverse-sorted" (check-equal? (bubble-sort '(3 2 1) <) '(1 2 3)))
      (test-case "negatives and decimals"
        (check-equal? (bubble-sort '(-1 2.5 0 -3) <) '(-3 -1 0 2.5)))))

   (test-suite
    "insertion-sort"
    (test-suite "- valid"
      (test-case "unsorted"
        (check-equal? (insertion-sort '(3 1 4 1 5 9 2 6)) '(1 1 2 3 4 5 6 9))))
    (test-suite "- edge"
      (test-case "empty" (check-equal? (insertion-sort '()) '()))
      (test-case "single" (check-equal? (insertion-sort '(42)) '(42)))
      (test-case "reverse-sorted" (check-equal? (insertion-sort '(5 4 3 2 1)) '(1 2 3 4 5)))
      (test-case "negatives and decimals"
        (check-equal? (insertion-sort '(-1 2.5 0 -3)) '(-3 -1 0 2.5)))))

   (test-suite
    "quick-sort"
    (test-suite "- valid"
      (test-case "ascending with <"
        (check-equal? (quick-sort '(3 1 4 1 5 9 2 6) <) '(1 1 2 3 4 5 6 9)))
      (test-case "descending with >"
        (check-equal? (quick-sort '(3 1 4 1 5) >) '(5 4 3 1 1))))
    (test-suite "- edge"
      (test-case "empty" (check-equal? (quick-sort '() <) '()))
      (test-case "single" (check-equal? (quick-sort '(7) <) '(7)))
      (test-case "already sorted" (check-equal? (quick-sort '(1 2 3) <) '(1 2 3)))
      (test-case "negatives and decimals"
        (check-equal? (quick-sort '(-1 2.5 0 -3) <) '(-3 -1 0 2.5)))))

   (test-suite
    "selection-sort"
    (test-suite "- valid"
      (test-case "unsorted"
        (check-equal? (selection-sort '(3 1 4 1 5 9 2 6)) '(1 1 2 3 4 5 6 9))))
    (test-suite "- edge"
      (test-case "single" (check-equal? (selection-sort '(9)) '(9)))
      (test-case "reverse-sorted" (check-equal? (selection-sort '(5 4 3 2 1)) '(1 2 3 4 5)))
      (test-case "negatives and decimals"
        (check-equal? (selection-sort '(-1 2.5 0 -3)) '(-3 -1 0 2.5)))))))

(run-tests sort-tests)
