;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#lang racket
(require rackunit)
(provide zero-num?
         one?
         pos?
         neg?
         sum-lesser? 
         sum-greater?
         sum-equal?
         even-num?
         odd-num?
         square?
         prime-custom?
         pythagoras-proof?)

;; check if a number is 0  
(define (zero-num? n) (= n 0))

;; check if a number is 1 
(define (one? n) (= n 1))

;; check if a number is positive
(define (pos? n) (>= n 0))

;; check if a number is negative
(define (neg? n) (< n 0))

;; check if the sum of first two numbers is lesser than the third  
(define (sum-lesser? x y z) (< (+ x y) z))

;; check if the sum of first two numbers is greater than the third
(define (sum-greater? x y z) (> (+ x y) z))

;; check if the sum of first two numbers is equal to third
(define (sum-equal? x y z) (= (+ x y) z))

;; check if a number is even
(define (even-num? n) (zero-num? (remainder n 2)))

;; checks if a number is odd
(define (odd-num? n) (not (= (remainder n 2) 0)))

;; check if a number is a perfect square 
(define (square? n) (integer? (sqrt n)))

;; check if a number is prime
(define (prime-custom? n)
  (define (prime-iter n count)
    (cond ((zero? (remainder n count)) #f)
          ((< n (sqr count)) #t)
          (else (prime-iter n (add1 count)))))
 (cond ((< n 2) #f)
       ((= n 2) #t)
       (else (prime-iter n 2))))

;; baudhayana/pythagoras proof using lexical scoping
(define (pythagoras-proof? x y z)
  (define (area-of-outer-sqr) (+ (sqr x) (* 2 x y) (sqr y)))
  (define (area-of-inner-sqr) (+ (area-of-four-triangles x y) (sqr z)))
  (define (area-of-four-triangles b h) (/ (* 4 b h) 2))
  (= (area-of-outer-sqr) (area-of-inner-sqr)))

;; Tests
(check-true (zero-num? 0))
(check-false (zero-num? 1))

(check-true (one? 1))
(check-false (one? 0))

(check-true (pos? 5))
(check-true (pos? 0))
(check-false (pos? -1))

(check-true (neg? -5))
(check-false (neg? 0))

(check-true (sum-lesser? 1 2 5))
(check-false (sum-lesser? 3 4 5))

(check-true (sum-greater? 3 4 5))
(check-false (sum-greater? 1 2 5))

(check-true (sum-equal? 2 3 5))
(check-false (sum-equal? 2 3 6))

(check-true (even-num? 4))
(check-false (even-num? 5))

(check-true (odd-num? 5))
(check-false (odd-num? 4))

(check-true (square? 4))
(check-true (square? 9))
(check-false (square? 5))

(check-true (prime-custom? 2))
(check-true (prime-custom? 7))
(check-false (prime-custom? 4))
(check-false (prime-custom? 1))

(check-true (pythagoras-proof? 3 4 5))
(check-true (pythagoras-proof? 5 12 13))
