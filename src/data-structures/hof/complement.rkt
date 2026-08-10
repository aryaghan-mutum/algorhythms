;; Author: Anurag Muthyam

#lang racket

(require rackunit racket/trace)
(provide complement)

(define (complement fn)
  (lambda x (not (apply fn x))))

;; Alternative implementations kept for reference (commented out) --
;; complement above is the active implementation (variadic, matches racket/function's negate).
#|
(define (complement-v2 fn x)
  (not (fn x)))

(define (complement-v3 fn)
  (lambda (x) (not (fn x))))
|#
