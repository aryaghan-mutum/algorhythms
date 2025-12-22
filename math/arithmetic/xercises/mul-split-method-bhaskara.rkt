#lang racket

(require racket/trace)
#|
Bhaskara charya's split methd from lilavathi. page 14.

steps:
1. take two numbers
2. get the max and min numbers from a and b
3. split the min number two two which is half.
4. multiply max with half, lets say result1
5. multiply max with another half say result2
6. add two results: total results: result1 + result2

|#
(define (mul-split-method a b)
  (let* ((min (min a b))
         (max (max a b))
         (half (/ min 2))
         (result (* max half 2)))
    result))
   

(mul-split-method 8 2)
(mul-split-method 8 3)


(define (mul-split-method2 a b)
  (define min! (min a b))
  (define max! (max a b))
  (define half (/ min! 2))
  (define multiply (* max! half))
  (* multiply 2))


(mul-split-method2 8 2)
(mul-split-method 8 3)





