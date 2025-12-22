#lang racket

(require racket/trace)


;; Add all the numbers in fibonacci series for a given length

(define (fib n)
    (cond ((= n 0) 0)
          ((= n 1) 1)
          (else (+ (fib (- n 1))
                   (fib (- n 2))))))

(define (sum-fib-nums n)
  (sum-fib-nums-helper (build-list n fib) 0))

(define (sum-fib-nums-helper lst sum)
  (if (empty? lst)
      sum
      (sum-fib-nums-helper (cdr lst)
                           (+ sum (car lst)))))

(trace sum-fib-nums-helper)
(sum-fib-nums 10)
