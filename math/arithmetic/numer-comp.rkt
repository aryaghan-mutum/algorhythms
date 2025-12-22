;; Author: Anurag Muthyam <anu.drumcoder@gmail.com>

#lang racket 

(provide square 
         square-map 
         cube 
         cube-map 
         sum-of-squares 
         sum-of-cubes 
         double 
         double-map
         triple 
         triple-map
         add1 
         add1-map
         sub1 
         sub1-map
         min 
         max 
         abs 
         abs-map
         reciprocal
         reciprocal-map
         0? 
         0map?
         1? 
         1map?
         pos? 
         pos-map?
         neg?
         neg-map? 
         sum-lesser? 
         sum-greater? 
         even? 
         even-map?
         odd?
         odd-map?)

(define (square n) (* n n))

(define (square-map lst) (map square lst))

(define (cube n) (* n n n))

(define (cube-map lst) (map cube lst))

(define (sum-of-squares x y) (+ (square x) (square y)))

(define (sum-of-cubes x y) (+ (cube x) (cube y)))  

(define (double n) (* n 2))

(define (double-map lst) (map double lst))

(define (triple n) (* n 3))

(define (triple-map lst) (map triple lst))

(define (add1 n) (+ n 1))

(define (add1-map lst) (map add1 lst))

(define (sub1 n) (- n 1))

(define (sub1-map lst) (map sub1 lst))

(define (min a b) (if (< a b) a b))

(define (max a b) (if (> a b) a b))

(define (abs n) (if (pos? n) n (- n)))

(define (abs-map lst) (map abs lst))

(define (reciprocal n)
  (if (0? n)
      (error "reciprocal/inverse of 0 is undefined")
      (/ 1 n)))

(define (reciprocal-map lst) (map reciprocal lst))

(define (0? n) (if (= n 0) #t #f))

(define (0map? lst) (map 0? lst))

(define (1? n) (if (= n 1) #t #f))

(define (1map? lst) (map 1? lst))

(define (pos? n) (if (>= n 0) #t #f))

(define (pos-map? lst) (map pos? lst))

(define (neg? n) (if (< n 0) #t #f))

(define (neg-map? lst) (map neg? lst))

(define (sum-lesser? x y z) (< (+ x y) z))

(define (sum-greater? x y z) (> (+ x y) z))

(define (even? n) (0? (remainder n 2)))

(define (even-map? lst) (map even? lst))

(define (odd? n) (not (= (remainder n 2) 0)))

(define (odd-map? lst) (map odd? lst))