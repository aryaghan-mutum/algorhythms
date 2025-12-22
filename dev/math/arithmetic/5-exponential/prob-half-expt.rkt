#lang racket

(require racket/trace)

;; Anurag Muthyam

;; half the exponent: exponential problem
#|
write a procedure when n is an integer then do 2^n to the integer and half(n/2) every iteration until it reaches 1 
|#

(define (half-exponential n)
  (if (integer? n)
      (let ((expo (expt 2 n)))
      (he-iter expo))
      (write (format "~a isn't an integer" n))))

(define (he-iter expo)
  (if (= expo 1)
      expo
      (he-iter (/ expo 2))))

(trace he-iter)
(half-exponential 20)