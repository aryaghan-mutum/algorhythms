;; Author: Anurag Muthyam

;; The function adds all the numbers in a list and returns the number

#lang racket

(provide sum-list
         sum-to-n)

;; sum of the integers from 1 to n; only exact non-negative integers ever reach the
;; zero base case by repeated sub1, so anything else is rejected instead of looping forever
;; sum-to-n : exact-nonnegative-integer? -> exact-nonnegative-integer?
(define (sum-to-n n)
  (unless (exact-nonnegative-integer? n)
    (error 'sum-to-n "expects a non-negative integer, given ~a" n))
  (sum-to-n-aux n 0))

(define (sum-to-n-aux n acc)
  (if (zero? n)
      acc
      (sum-to-n-aux (sub1 n) (+ acc n))))

(define (sum-list lst)
  (apply + lst))

;; Alternative implementations kept for reference (commented out) --
;; sum-list above is the active implementation (idiomatic, uses the built-in +).
#|
(define (sum-list-v1 lst)
  (cond ((empty? lst) 0)
        (else (+ (car lst) (sum-list-v1 (cdr lst))))))

(define (sum-list-v2 lst)
  (cond ((empty? lst) 0)
        ((pair? lst)
         (+ (car lst) (sum-list-v2 (cdr lst))))))

(define (sum-list-v3 lst)
  (cond ((= 1 (length lst)) (car lst))
        (else (+ (car lst) (sum-list-v3 (cdr lst))))))

(define (sum-list-v4 lst)
  (define (sum-iter lst sum)
    (cond ((empty? lst) sum)
          (else (sum-iter (cdr lst) (+ (car lst) sum)))))
  (sum-iter lst 0))

(define (sum-list-v5 lst)
  (foldr + 0 lst))
|#

