#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide collatz-steps)

;; Return the number of Collatz-conjecture steps needed to reach 1 starting from `n`
;; (n/2 if even, 3n+1 if odd). Counts each step; reaching n=1 returns 1.
;; collatz-steps : exact-positive-integer? -> exact-positive-integer?
(define (collatz-steps n)
  (define (loop n count)
    (cond ((<= n 0) (error 'collatz-steps "requires a positive integer; got ~a" n))
          ((= n 1) count)
          ((even? n) (loop (/ n 2) (add1 count)))
          (else (loop (+ (* 3 n) 1) (add1 count)))))
  (loop n 1))
