#lang racket

;Author: Anurag Muthyam

;The first 10 Fibonacci Series:
; n:    0 1 2 3 4 5 6  7  8  9 10
; F(n): 0 1 1 2 3 5 8 13 21 34 55
;https://en.wikipedia.org/wiki/Fibonacci_number

(require racket/trace)

(writeln "Method 4: Iterative process")
(define (fib-iter1 n)
  (define (fib acc1 acc2 n)
    (if (= n 2)
         acc1
         (fib (+ acc1 acc2) acc1 (- n 1))))
    (fib 1 1 n))

(fib-iter1 8) ;21

(writeln "Method 5: Iterative process")
(define (fib-iter2 n)
   (fib-i 1 1 n))

(define (fib-i acc1 acc2 n)
  (if (= n 2)
      acc1
      (fib-i (+ acc1 acc2)
             acc1
             (- n 1))))
(fib-iter2 8)
#|
Iterative process:
(fib-i 1 1 8) ;21
>(fib-i 1 1 8)
>(fib-i 2 1 7)
>(fib-i 3 2 6)
>(fib-i 5 3 5)
>(fib-i 8 5 4)
>(fib-i 13 8 3)
>(fib-i 21 13 2)
|#

(writeln "Method 6: Iterative process")
(define (fibb n)
    (fib-iter 1 0 n))

(define (fib-iter a b count)
    (if (zero? count)
        b
        (fib-iter (+ a b)
                  a
                  (sub1 count))))


(trace fib-iter)
(fib-iter 1 0 8)

#|
>(fib-iter 1 0 8)
>(fib-iter 1 1 7)
>(fib-iter 2 1 6)
>(fib-iter 3 2 5)
>(fib-iter 5 3 4)
>(fib-iter 8 5 3)
>(fib-iter 13 8 2)
>(fib-iter 21 13 1)
>(fib-iter 34 21 0)
<21
|#
