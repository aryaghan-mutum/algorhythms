;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

;The first 10 Fibonacci Series:
; n:    0 1 2 3 4 5 6  7  8  9 10
; F(n): 0 1 1 2 3 5 8 13 21 34 55
;https://en.wikipedia.org/wiki/Fibonacci_number

#lang racket
(require racket/trace rackunit threading)
(provide fibonacci-v1
         fibonacci-v2
         fibonacci-v3
         fibonacci-v4
         fibonacci-v5
         fibonacci-optimized
         fibonacci-list
         fibonacci-count-v1
         fibonacci-count-v2
         sum-fibonacci-v1
         sum-fibonacci-v2
         sum-even-fibonacci-v1)

;; =================

;; recursive process version 1
(define (fibonacci-v1 n)
    (cond ((= n 0) 0)
          ((= n 1) 1)
          ((< n 0) "the series must be (n>1)")
          (else (+ (fibonacci-v1 (- n 1))
                   (fibonacci-v1 (- n 2))))))

;; =================

;; recursive process version 2
(define (fibonacci-v2 n)
    (if (< n 2)
        n
        (+ (fibonacci-v2 (- n 1))
           (fibonacci-v2 (- n 2)))))

;; =================

;; recursive process version 3
(define (fibonacci-v3 n)
  (let ((acc0 0) (acc1 1))
    (cond ((= n 0) acc0)
          ((= n 1) acc1)
          ((< n 0) "the series must be (n>1)")
          (else (+ (fibonacci-v3 (- n 1))
                   (fibonacci-v3 (- n 2)))))))

;; =================

;; recurisve process and let version 4
(define (fibonacci-v4 n)
  (let loop ((n n))
    (cond ((zero? n) 0)
          ((= n 1) 1)
          (else (+ (loop (- n 1)) (loop (- n 2)))))))

;; =================

;; iterative process version 5
(define (fibonacci-v5 n)
  (define (fib-iter acc1 acc2 count)
    (cond ((zero? count) acc2)
          (else
           (fib-iter (+ acc1 acc2) acc1 (sub1 count)))))
  (fib-iter 1 0 n))

;; =================

; iterative process using logarithmic form O(log n)
(define (fibonacci-optimized n)
  (fibonacci-optimized-aux 1 0 0 1 n))

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

;; =================

;; fibonacci for each element in a list
(define (fibonacci-list lst)
  (map fibonacci-v1 lst))

;; =================

;; iterative process fibonacci count version 1
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

;; recursive process fibonacci count version 2
(define (fibonacci-count-v2 n)
  (define (fib-rec n count)
    (cond ((= n 0) 0)
          ((= n 1) 1)
          ((< n 0) "the series must be (n>1)")
          (else (+ (fib-rec (- n 1) (add1 count))
                   (fib-rec (- n 2) (add1 count))))))
  (fib-rec n 0))

;; =================

;; add all the fib elements based on a limit n verion 1
(define (sum-fibonacci-v1 n)
  (define (sum-fib-aux lst sum)
    (cond ((empty? lst) sum)
          (else (sum-fib-aux (cdr lst)
                                     (+ sum (car lst))))))
  (sum-fib-aux (build-list n fibonacci-v1) 0))

;; using foldr version 2
(define (sum-fibonacci-v2 n)
  (define lst (build-list n fibonacci-v1))
  (foldr + 0 lst))

;; =================

;; easier way: using higher order functions version 1
(define (sum-even-fibonacci-v1 n)
  (~> (build-list (add1 n) values)
      (map fibonacci-v1 _)
      (filter even? _)
      (foldr + 0 _)))

;; =================

(check-eqv? (fibonacci-v1 0) 0)
(check-eqv? (fibonacci-v1 1) 1)
(check-eqv? (fibonacci-v1 2) 1)
(check-eqv? (fibonacci-v1 3) 2)
(check-eqv? (fibonacci-v1 10) 55)

(check-eqv? (fibonacci-v2 0) 0)
(check-eqv? (fibonacci-v2 1) 1)
(check-eqv? (fibonacci-v2 10) 55)

(check-eqv? (fibonacci-v3 0) 0)
(check-eqv? (fibonacci-v3 1) 1)
(check-eqv? (fibonacci-v3 10) 55)

(check-eqv? (fibonacci-v4 0) 0)
(check-eqv? (fibonacci-v4 1) 1)
(check-eqv? (fibonacci-v4 10) 55)

(check-eqv? (fibonacci-v5 0) 0)
(check-eqv? (fibonacci-v5 1) 1)
(check-eqv? (fibonacci-v5 10) 55)

(check-eqv? (fibonacci-optimized 0) 0)
(check-eqv? (fibonacci-optimized 1) 1)
(check-eqv? (fibonacci-optimized 10) 55)

(check-equal? (fibonacci-list '(0 1 2 3)) '(0 1 1 2))

(check-eqv? (fibonacci-count-v1 0) 0)
(check-eqv? (fibonacci-count-v1 1) 1)
(check-eqv? (fibonacci-count-v1 10) 10)

(check-eqv? (sum-fibonacci-v1 0) 0)
(check-eqv? (sum-fibonacci-v1 1) 0)
(check-eqv? (sum-fibonacci-v1 2) 1)
(check-eqv? (sum-fibonacci-v1 3) 2)
(check-eqv? (sum-fibonacci-v1 10) 88)

(check-eqv? (sum-fibonacci-v2 0) 0)
(check-eqv? (sum-fibonacci-v2 1) 0)
(check-eqv? (sum-fibonacci-v2 2) 1)
(check-eqv? (sum-fibonacci-v2 3) 2)
(check-eqv? (sum-fibonacci-v2 10) 88)

(check-eqv? (sum-even-fibonacci-v1 10) 44)
