;; Author: Anurag Muthyam

#lang racket
(require "cube.rkt")
(provide sum-of-cubes-in-range)

;; sum of cubes of the integers a..b inclusive
;; sum-of-cubes-in-range : integer? integer? -> integer?
(define (sum-of-cubes-in-range a b)
  (sum-of-cubes-in-range-iter a b 0))

(define (sum-of-cubes-in-range-iter a b acc)
  (if (> a b)
      acc
      (sum-of-cubes-in-range-iter (add1 a) b (+ acc (cube a)))))

;; Alternative implementation kept for reference (commented out) --
;; sum-of-cubes-in-range above is the active (iterative) implementation. The original
;; "iterative" alternative here (sum-cubes-p2/sum-cubes-iter) had a real bug: its
;; accumulator was replaced with (cube m) each step instead of added to, so it actually
;; returned just (cube b) -- e.g. sum-cubes-p2(1,5) gave 125 instead of the correct 225.
#|
(define (cube n) (* n n n))

;; Recursive process
(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (cube a)
         (sum-cubes (add1 a) b))))

;; Iterative process (buggy: accumulator c was never actually accumulated)
(define (sum-cubes-p2 a b)
  (sum-cubes-iter a b 0))

(define (sum-cubes-iter a b c)
  (let ((m a)
        (n b))

   (if (> a b)
       c
       (sum-cubes-iter (add1 a)
                       b
                       (cube m)))))
|#
