;; Author: Anurag Muthyam

#lang racket

(require threading racket/trace rackunit)
(provide even-v1?
         odd-v1?
         even-v2?
         odd-v2?
         even-v3?
         odd-v3?
         even-v4?
         odd-v4?)

;; checks if a number is even (easiest way!) version 1
(define (even-v1? n)
  (zero? (remainder n 2)))

;; checks if a number is odd (easiest way!) version 1
(define (odd-v1? n)
  (not (zero? (remainder n 2))))

;; checks if a number is even version 2
(define (even-v2? n)
  (if (= (remainder n 2) 0) #t #f))

;; checks if a number is odd version 2
(define (odd-v2? n)
  (not (even-v2? n)))

;; checks if a number is even version 3
(define (even-v3? n)
  (not (odd-v3? n)))

;; checks if a number is odd version 3
(define (odd-v3? n)
  (not (= (remainder n 2) 0)))

;; checks if a number is even version 4
;; even-v4? and odd-v4 doesn't work for negative numbers
(define (even-v4? n)
  (or (zero? n)
      (odd-v4? (sub1 n))))

;; checks if a number is odd  version 4
;; even-v4? and odd-v4 doesn't work for negative numbers
(define (odd-v4? n)
  (and (not (zero? n))
      (even-v4? (sub1 n))))

;; get even nnumbers list
(define (even-lst lst)
  (nums-lst lst '() even?))

;; get odd nnumbers list
(define (odd-lst lst)
  (nums-lst lst '() odd?))

;; helper function
(define (nums-lst xlst ylst f)
  (cond ((empty? xlst) ylst)
        ((f (car xlst))
         (nums-lst (cdr xlst) (cons (car xlst) ylst) f))
        (else (nums-lst (cdr xlst) ylst f))))


;;;;


;; Generate all all the even numbers in a fib series

;; actual algorithm 
(define (sum-fib-even-nums n)
  (sum-fib-nums-helper (even-lst (build-list n fib)) 0))

(define (sum-fib-nums-helper lst sum)
  (if (empty? lst)
      sum
      (sum-fib-nums-helper (cdr lst)
                           (+ sum (car lst)))))

;; fib algorithm
(define (fib n)
    (cond ((= n 0) 0)
          ((= n 1) 1)
          (else (+ (fib (- n 1))
                   (fib (- n 2))))))

;; get even nnumbers list
(define (even-lst lst)
  (nums-lst lst '() even?))

(define (nums-lst xlst ylst f)
  (cond ((empty? xlst) ylst)
        ((f (car xlst))
         (nums-lst (cdr xlst) (cons (car xlst) ylst) f))
        (else (nums-lst (cdr xlst) ylst f))))

