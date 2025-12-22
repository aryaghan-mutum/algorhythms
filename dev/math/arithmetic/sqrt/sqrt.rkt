#lang racket

;; method 1:
(define (sqrt-root x)
  
  (define (average x y) (/ (+ x y) 2))
  (define (square n) (* n n))
  
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) .0001))
  
  (define (improve guess)
    (average guess (/ x guess)))
  
  (define (try guess)
    (if (good-enough? guess)
	guess
	(try (improve guess))))
  
  (try 1.0))


(sqrt-root 100)  ;10.000000000139897
(sqrt-root 625)  ;25.000000063076968
(sqrt-root pi)   ;1.7724538555800293

