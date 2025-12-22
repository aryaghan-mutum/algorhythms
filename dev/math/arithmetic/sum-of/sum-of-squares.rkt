#lang racket

;; Author: Anurag Muthyam
;; Sum of Squares:
(provide sum-sqrs 
         sum-of-squares)

;; sum of squares using recursion 
(define (sum-sqrs n)
  (define (sum-sqrs-iter lst sum)
    (if (empty? lst)
        sum
        (sum-sqrs-iter (cdr lst)
                       (+ sum (car lst)))))
  (sum-sqrs-iter (build-list n (lambda (x) (* x x))) 0))


;; sum of squares of two numbers 
(define sum-of-squares
  (λ (x y)
    (+ (sqr x) (sqr y))))


;; version 2: sum of squares of two numbers using nested functions
(define (sum-of-squares2 s1 s2)
  (define (sqr n) (* n n))
  (define (sum s1 s2) (+ s1 s2))
  (sum (sqr s1) (sqr s2)))

;; version 3: sum of squares of two numbers using let
(define (sum-of-squares3 s1 s2)
  (let* ((sq1 (* s1 s1))
         (sq2 (* s2 s2))
         (sum (+ sq1 sq2)))
    sum))
        

(writeln "Method 4 Using let*")
(define (sum-of-squares-p4 s1 s2)
  (let* ((sq1 (* s1 s1))
         (sq2 (* s2 s2))
         (sum (+ sq1 sq2)))
    sum))
        
(sum-of-squares-p4 2 3)     ;;13
