#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require rackunit
         rackunit/text-ui
         "../../src/data-structures/set/set.rkt"
         "../../src/data-structures/set/set-union.rkt"
         "../../src/data-structures/set/set-intersection.rkt"
         "../../src/data-structures/set/set-move-elem-to-last.rkt"
         "../../src/data-structures/set/compress.rkt"
         "../../src/data-structures/set/duplicates.rkt")

(define set-tests
  (test-suite
   "Set operations"

   (test-suite
    "unique-elements - valid"
    (test-case "removes duplicates, preserves first-occurrence order"
      (check-equal? (unique-elements '(1 2 1 3 2 4)) '(1 2 3 4)))
    (test-case "handles mixed types"
      (check-equal? (unique-elements '(a 1 a 2 1)) '(a 1 2))))

   (test-suite
    "unique-elements - edge"
    (test-case "empty list" (check-equal? (unique-elements '()) '()))
    (test-case "single element" (check-equal? (unique-elements '(x)) '(x)))
    (test-case "all identical" (check-equal? (unique-elements '(5 5 5 5)) '(5))))

   (test-suite
    "set-union - valid"
    (test-case "two disjoint sets"
      (check-equal? (sort (set-union '(1 2) '(3 4)) <) '(1 2 3 4)))
    (test-case "overlapping sets deduplicated"
      (check-equal? (sort (set-union '(1 2 3) '(2 3 4)) <) '(1 2 3 4))))

   (test-suite
    "set-union - edge"
    (test-case "both empty" (check-equal? (set-union '() '()) '()))
    (test-case "left empty" (check-equal? (set-union '() '(1 2)) '(1 2)))
    (test-case "right empty" (check-equal? (set-union '(1 2) '()) '(1 2))))

   (test-suite
    "set-intersection - valid"
    (test-case "overlapping"
      (check-equal? (set-intersection '(1 2 3 4 7) '(3 4 5 6)) '(3 4)))
    (test-case "disjoint yields empty"
      (check-equal? (set-intersection '(9 8 7) '(3 4 5 6)) '())))

   (test-suite
    "set-intersection - edge"
    (test-case "both empty" (check-equal? (set-intersection '() '()) '()))
    (test-case "left empty" (check-equal? (set-intersection '() '(10)) '()))
    (test-case "right empty" (check-equal? (set-intersection '(10) '()) '()))
    (test-case "single, no match" (check-equal? (set-intersection '(9) '(10)) '()))
    (test-case "negative and decimal match"
      (check-equal? (set-intersection '(-1 1.5 2) '(-1 1.5)) '(-1 1.5))))

   (test-suite
    "set-move-elem-to-last - valid"
    (test-case "moves 3 and dedupes"
      (check-equal? (set-move-elem-to-last '(0 1 0 3 12) 3) '(0 1 0 12 3)))
    (test-case "moves 0 and dedupes"
      (check-equal? (set-move-elem-to-last '(0 1 0 3 12) 0) '(1 3 12 0)))
    (test-case "moves 1"
      (check-equal? (set-move-elem-to-last '(0 1 0 3 12) 1) '(0 0 3 12 1))))

   (test-suite
    "set-move-elem-to-last - edge"
    (test-case "single-element list equal to e"
      (check-equal? (set-move-elem-to-last '(0) 0) '(0)))
    (test-case "empty list becomes '(e)"
      (check-equal? (set-move-elem-to-last '() 100) '(100)))
    (test-case "negative element"
      (check-equal? (set-move-elem-to-last '(-1 2 -1 3) -1) '(2 3 -1))))

   (test-suite
    "compress - valid"
    (test-case "collapses consecutive duplicates"
      (check-equal? (compress '(1 1 2 3 3 3 4)) '(1 2 3 4)))
    (test-case "non-adjacent duplicates preserved"
      (check-equal? (compress '(1 2 1 2)) '(1 2 1 2))))

   (test-suite
    "compress - edge"
    (test-case "empty" (check-equal? (compress '()) '()))
    (test-case "singleton" (check-equal? (compress '(5)) '(5))))

   (test-suite
    "duplicates-by-elem / duplicates-by-fn - valid"
    (test-case "duplicates-by-elem returns every hit"
      (check-equal? (duplicates-by-elem '(1 2 3 2 4 2) 2) '(2 2 2)))
    (test-case "duplicates-by-fn keeps matches"
      (check-equal? (duplicates-by-fn even? '(1 2 3 4 5 6)) '(6 4 2))))

   (test-suite
    "duplicates-by-elem / duplicates-by-fn - edge"
    (test-case "no matches yields empty" (check-equal? (duplicates-by-elem '(1 2 3) 9) '()))
    (test-case "empty input" (check-equal? (duplicates-by-fn odd? '()) '())))))

(run-tests set-tests)
