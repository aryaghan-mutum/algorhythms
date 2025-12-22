#lang racket

;; Author: Anurag Muthyam
;; Even and Odd procedure implementation

(writeln "Method 1: using if")
(define (even-m1? n)
  (if (= (remainder n 2) 0)
      #t
      #f))

(define (odd-m1? n)
  (not (even-m1? n)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(writeln "Method 2: using not")
(define (odd-m2? n)
  (not (= (remainder n 2) 0)))

(define (even-m2? n)
  (not (odd-m2? n)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(writeln "Method 3 using and, or:")
(define (even-m3? n)
  (or (zero? n)
      (odd-m3? (sub1 n))))


(define (odd-m3? n)
  (and (not (zero? n))
      (even-m1? (sub1 n))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(writeln "Method 4 easiest way:")
(define (even?? n)
  (zero? (remainder n 2)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(even?? 3)