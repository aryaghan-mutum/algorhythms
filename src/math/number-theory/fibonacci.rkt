;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

;The first 10 Fibonacci Series:
; n:    0 1 2 3 4 5 6  7  8  9 10

#lang racket
(require threading)
(provide fibonacci-optimized
         fibonacci-list
         sum-fibonacci
         sum-even-fibonacci
         (rename-out [fibonacci-optimized fibonacci]))

;; iterative process using logarithmic form O(log n)
;; fibonacci-optimized : natural? -> natural?
(define (fibonacci-optimized n)
  (when (negative-num? n)
    (error 'fibonacci-optimized "expects a non-negative integer, given ~a" n))
  (fibonacci-optimized-aux 1 0 0 1 n))

(define (negative-num? n) (< n 0))

(define (fibonacci-optimized-aux a b p q counter)
  (cond ((zero? counter) b)
        ((even? counter) (fibonacci-optimized-aux a
                                                  b
                                                  (+ (sqr p) (sqr q))
                                                  (+ (* 2 p q) (sqr q))
                                                  (/ counter 2)))
        (else (fibonacci-optimized-aux (+ (* b q) (* a q) (* a p))
                                       (+ (* b p) (* a q))
                                       p
                                       q
                                       (sub1 counter)))))

;; fibonacci for each element in a list
;; fibonacci-list : (listof natural?) -> (listof natural?)
(define (fibonacci-list lst)
  (map fibonacci-optimized lst))

;; sum of the first n Fibonacci numbers F(0)..F(n-1)
;; sum-fibonacci : natural? -> natural?
(define (sum-fibonacci n)
  (define lst (build-list n fibonacci-optimized))
  (foldr + 0 lst))

;; sum of the even Fibonacci numbers among F(0)..F(n)
;; sum-even-fibonacci : natural? -> natural?
(define (sum-even-fibonacci n)
  (~> (build-list (add1 n) values)
      (map fibonacci-optimized _)
      (filter even? _)
      (foldr + 0 _)))

;; Alternative implementations kept for reference (commented out) --
;; fibonacci-optimized above is the active implementation: O(log n) via matrix exponentiation.
;; fibonacci-count-v1/fibonacci-count-v2 were removed entirely: v1 just returned its own input
;; relabelled as a "count", and v2 ignored its own accumulator and recomputed naive fibonacci --
;; both were broken/misleading duplicates with no real distinct purpose or test coverage.
#|
;; recursive process version 1
(define (fibonacci-v1 n)
    (cond ((= n 0) 0)
          ((= n 1) 1)
          ((< n 0) "the series must be (n>1)")
          (else (+ (fibonacci-v1 (- n 1))
                   (fibonacci-v1 (- n 2))))))

;; recursive process version 2
(define (fibonacci-v2 n)
    (if (< n 2)
        n
        (+ (fibonacci-v2 (- n 1))
           (fibonacci-v2 (- n 2)))))

;; recursive process version 3
(define (fibonacci-v3 n)
  (let ((acc0 0) (acc1 1))
    (cond ((= n 0) acc0)
          ((= n 1) acc1)
          ((< n 0) "the series must be (n>1)")
          (else (+ (fibonacci-v3 (- n 1))
                   (fibonacci-v3 (- n 2)))))))

;; recurisve process and let version 4
(define (fibonacci-v4 n)
  (let loop ((n n))
    (cond ((zero? n) 0)
          ((= n 1) 1)
          (else (+ (loop (- n 1)) (loop (- n 2)))))))

;; iterative process version 5
(define (fibonacci-v5 n)
  (define (fib-iter acc1 acc2 count)
    (cond ((zero? count) acc2)
          (else
           (fib-iter (+ acc1 acc2) acc1 (sub1 count)))))
  (fib-iter 1 0 n))

;; iterative process fibonacci count version 1 (removed: returned n mislabeled as a count)
(define (fibonacci-count-v1 n)
  (define (fib-iter acc1 acc2 n count)
    (cond ((zero? n) count)
          ((< n 0) "the series must be (n>1)")
          (else
           (fib-iter (+ acc1 acc2)
                     acc1
                     (sub1 n)
                     (add1 count)))))
  (fib-iter 1 0 n 0))

;; recursive process fibonacci count version 2 (removed: ignored its own count accumulator)
(define (fibonacci-count-v2 n)
  (define (fib-rec n count)
    (cond ((= n 0) 0)
          ((= n 1) 1)
          ((< n 0) "the series must be (n>1)")
          (else (+ (fib-rec (- n 1) (add1 count))
                   (fib-rec (- n 2) (add1 count))))))
  (fib-rec n 0))

;; add all the fib elements based on a limit n version 1
(define (sum-fibonacci-v1 n)
  (define (sum-fib-aux lst sum)
    (cond ((empty? lst) sum)
          (else (sum-fib-aux (cdr lst)
                             (+ sum (car lst))))))
  (sum-fib-aux (build-list n fibonacci-optimized) 0))
|#
