#lang racket

;; Author: Anurag Muthyam
;; Sum of Squares:

(define (square n) (* n n))

(writeln "Method 1")
(define (sum-of-squares-p1 s1 s2) (+ s1 s2))
(sum-of-squares-p1 (square 2) (square 3))  ;13

(writeln "Method 2. Functions inside the function body")
(define (sum-of-squares-p2 s1 s2)
  (define (square n) (* n n))
  (define (sum s1 s2) (+ s1 s2))
  (sum (square s1) (square s2)))

(sum-of-squares-p2 2 3)   ;13

(writeln "Method 3")
(define (sum-of-squares-p3 x y)
  (+ (square x) (square y)))

(sum-of-squares-p3 2 3)     ;;13


(writeln "Method 4 Using let*")
(define (sum-of-squares-p4 s1 s2)
  (let* ((sq1 (* s1 s1))
         (sq2 (* s2 s2))
         (sum (+ sq1 sq2)))
    sum))
        
(sum-of-squares-p4 2 3)     ;;13
