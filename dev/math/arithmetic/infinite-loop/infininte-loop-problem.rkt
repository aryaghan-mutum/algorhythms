#lang racket

#|
Problem on infinite loop:
What is the difference between run-forever and run-forever2
|#

;; "Method 3 Infinite loop"
(define (run-forever n)
  (if (zero? n)
      1
      (add1 (run-forever n))))

;; "Method 4 Infinite loop"
(define (run-forever2 n)
  (if (zero? n)
      (add1 n)
      (run-forever2 n)))


