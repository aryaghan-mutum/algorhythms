#lang racket

(require racket/trace)

;Author: Anurag Muthyam

;The first 10 Fibonacci Series:
; n:    0 1 2 3 4 5 6  7  8  9 10
; F(n): 0 1 1 2 3 5 8 13 21 34 55
;https://en.wikipedia.org/wiki/Fibonacci_number

(writeln "Method 1:")
(define (fib-rec1 n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        ((< n 0) "the series must be (n>1)")
        (else (+ (fib-rec1 (- n 1))
                 (fib-rec1 (- n 2))))))
(fib-rec1 8) ;21

(writeln "Method 2 using let")
(define fib-rec2
  (lambda (n)
    (let ((acc0 0) (acc1 1))
      (cond ((= n 0) acc0)
            ((= n 1) acc1)
            ((< n 0) "the series must be (n>1)")
            (else (+ (fib-rec2 (- n 1))
                     (fib-rec2 (- n 2))))))))

(fib-rec2 8) ;21

(writeln "Method 3:")
;; method 3 Recursive form:
(define fib-rec3
  (lambda (n)
    (if (< n 2)
        n
        (+ (fib-rec3 (- n 1))
           (fib-rec3 (- n 2))))))

(fib-rec3 8) ;21

(writeln "Method 4:")
(define (fib-rec4 n)
  (if (<= n 2)
      1
      (+ (fib-rec4 (- n 1))
         (fib-rec4 (- n 2)))))

(fib-rec4 8) 