#lang racket

;; Sorting Algorithm Examples
;; Demonstrates various sorting algorithms available in Algorhythms

(require algorhythms)

(displayln "=== Sorting Algorithm Comparisons ===\n")

(define test-list '(64 34 25 12 22 11 90 45 33 78))

(displayln "Original list:")
(displayln test-list)
(displayln "")

;; Bubble Sort - O(n²) time complexity
;; Simple comparison-based algorithm
(displayln "--- Bubble Sort ---")
(displayln "Best for: Small datasets, nearly sorted data")
(printf "Result: ~a\n\n" (bubble-sort test-list))

;; Insertion Sort - O(n²) time complexity
;; Efficient for small data sets
(displayln "--- Insertion Sort ---")
(displayln "Best for: Small datasets, online sorting")
(printf "Result: ~a\n\n" (insertion-sort test-list))

;; Selection Sort - O(n²) time complexity
;; Simple but inefficient for large lists
(displayln "--- Selection Sort ---")
(displayln "Best for: Small datasets, memory-limited environments")
(printf "Result: ~a\n\n" (selection-sort test-list))

;; Quick Sort - O(n log n) average time complexity
;; Efficient divide-and-conquer algorithm
(displayln "--- Quick Sort ---")
(displayln "Best for: Large datasets, general purpose sorting")
(printf "Result: ~a\n\n" (quick-sort test-list))

;; Comparison
(displayln "=== All algorithms produce the same result ===")
(displayln (equal? (bubble-sort test-list)
                   (insertion-sort test-list)
                   (selection-sort test-list)
                   (quick-sort test-list)))
