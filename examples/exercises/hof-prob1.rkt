#lang racket

#|
higher order function
In a function f, what is the difference between
1. (f 2 3 4)
2. (f sqr 3 4)
3. (f (sqr 2) 3 4)
|#

(define (f a x y) 
  (if (procedure? a)
      (+ (a x) (a y))
      (+ (sqr x) (sqr y))))

(f 2 3 4)   ;25
(f sqr 3 4) ;25
(f (sqr 2) 3 4) ;25
